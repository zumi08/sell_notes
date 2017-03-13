class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, :except => ["destroy"]
  def after_sign_in_path_for(resource)
    '/top'
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:name,:birthday,:adress,:college_id,:remenber_me]
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :name, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
    end

end
