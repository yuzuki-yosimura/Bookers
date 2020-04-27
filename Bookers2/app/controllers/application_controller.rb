class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for resource
    root_path
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: [:introduction])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_image_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_image_id])
  end

  private
     def sign_in_required
         redirect_to new_user_session_url unless user_signed_in?
     end

end
