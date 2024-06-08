class SuggestionsController < ApplicationController
    def index
      @suggestions = Suggestion.all
    end
  
    def show
      @suggestion = Suggestion.find(params[:id])
    end
  
    def new
      @suggestion = Suggestion.new
      @lawyers = Lawyer.all
      @risks = Risk.all
    end
  
    def create
      @suggestion = Suggestion.new(suggestion_params)
      if @suggestion.save
        redirect_to @suggestion
      else
        render :new
      end
    end
  
    private
  
    def suggestion_params
      params.require(:suggestion).permit(:risk_id, :lawyer_id)
    end
  end
  