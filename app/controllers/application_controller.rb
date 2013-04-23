class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_bidder

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :name, :password, :password_confirmation) }
  end
  
  def current_bidder
    if cookies[:current_bidder_name]
      { name: cookies[:current_bidder_name], email: cookies[:current_bidder_email] }
    else
      {}
    end
  end
end
