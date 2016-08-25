class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # expose :Application

  #decent_configuration { strategy DecentExposure::StrongParametersStrategy }

  def decent_configuration

  end

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation) }
  end
end
