class ApplicationController < ActionController::Base
  # before_action :authenticate_user!→OrdesControllersへ記述
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :family_name_kana, :first_name, :first_name_kana, :birth, :email, :password, :password_confirmation])
  end
end
