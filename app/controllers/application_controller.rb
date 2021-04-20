class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?


 protected
  
  def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :user_name, :telephone_number, :is_active])
       devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :user_name, :telephone_number, :profile_image_id, :is_active])
  end
end 
