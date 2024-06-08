class ContractsController < ApplicationController
  before_action :authenticate_user!

  def new
    @contract = Contract.new
  end

  def create
    @contract = current_user.contracts.build(contract_params)
    if @contract.save
      analyze_contract(@contract)
      redirect_to @contract
    else
      render :new
    end
  end

  def show
    @contract = Contract.find(params[:id])
    @suggestions = @contract.suggestions.includes(:lawyer)
  end

  def analyze
    @contract = Contract.find(params[:id])
    analyze_contract(@contract)
    redirect_to @contract
  end

  private

  def contract_params
    params.require(:contract).permit(:file)
  end

  def analyze_contract(contract)
    file_path = Rails.application.routes.url_helpers.rails_blob_path(contract.file, only_path: true)
    analysis = AiModelService.analyze(file_path)
    
    contract.update(analysis: analysis[:analysis], summary: analysis[:summary])
    
    analysis[:risks].each do |risk_data|
      risk = Risk.find_or_create_by(description: risk_data[:description], level: risk_data[:level])
      contract.risks << risk
      
      lawyers = Lawyer.where(specialization: risk.level)
      lawyers.each do |lawyer|
        contract.suggestions.create(risk: risk, lawyer: lawyer)
      end
    end
  end
end
