class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:department_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:prefecture_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:hobby])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:free]) 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
