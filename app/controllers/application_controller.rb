class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image, :user_path])
    end
    private
    
    def redirect_top
        redirect_to stories_path unless user_signed_in? 
    end
   
end
