class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery 
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from CanCan::AccessDEnied do |exception|
    flash[:error] = exception
  end
  #before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!

  force_ssl if: :ssl_configured?

  def ssl_configured?
    Rails.env.production?
  end

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action.!"
    redirect_to(request.referrer || root_path)
  end
end
