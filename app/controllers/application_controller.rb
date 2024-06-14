class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    protect_from_forgery prepend: true
    def after_sign_in_path_for(resource)
        new_contract_path
      end
    
      def after_sign_up_path_for(resource)
        new_contract_path
      end
end
