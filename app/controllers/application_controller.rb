# frozen_string_literal: true

# Controller for application wide functionality
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # Ensure the sanitization of the 'username' or 'email' login
  # parameter is valid
  protected

  # 'username' - allow for signing in with either email or username
  def configure_permitted_parameters
    added_attrs = %i[username email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
