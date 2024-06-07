# app/controllers/contracts_controller.rb
class ContractsController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @contract = Contract.new
    end
  
    def create
      @contract = current_user.contracts.build(contract_params)
      if @contract.save
        redirect_to @contract
      else
        render :new
      end
    end
  
    def show
      @contract = Contract.find(params[:id])
      @analysis_result = @contract.analysis_result
    end
  
    def analyze
      @contract = Contract.find(params[:id])
      file_content = @contract.file.download
      analysis = AiModelService.analyze(file_content)
      @contract.create_analysis_result!(risks: analysis[:risks], summary: analysis[:summary])
      redirect_to @contract
    end
  
    private
  
    def contract_params
      params.require(:contract).permit(:file)
    end
  end
  