class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :is_unauthenticated, if: :unauthenticated_root_path

  #decent_configuration { strategy DecentExposure::StrongParametersStrategy }

  def decent_configuration
  end

  def is_unauthenticated
    flash[:alert] = "You need to sign in or sign up before continuing." if !user_signed_in?
  end

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation) }
  end
end
