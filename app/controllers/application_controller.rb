class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pagy::Backend

  protected
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_up_path_for(resources)
    admin_path
  end

  def after_sign_in_path_for(resources)
    admin_path
  end
end