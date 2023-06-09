class ApplicationController < ActionController::Base
  include Pundit::Authorization

  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :check_locale

  protected

  def check_locale
    if request.query_parameters.include?(:locale)
      I18n.locale = params[:locale].to_sym
    end
  end

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :organization_id)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :organization_id)}
  end
end
