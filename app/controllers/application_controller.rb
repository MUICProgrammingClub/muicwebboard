class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :student_id_number, :phone_number, 
      :email, :password, :avatar, :line, :major_id, :facebook)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:first_name, :last_name, :student_id_number, :phone_number, 
      :email, :password, :avatar, :current_password, :facebook, :line, :major_id)}
  end

  private
  def after_sign_out_path_for(resource_or_scope)
  	user_session_path
  end
end
