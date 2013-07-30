class ApplicationController < ActionController::Base
  protect_from_forgery
  include SimpleCaptcha::ControllerHelpers
  before_filter :apply_layout
  layout :apply_layout
  def after_sign_in_path_for(resource)
    admins_path
  end

  def after_sign_out_path_for(resource_or_scope)
    redirect_url = new_admin_session_path
  end

  def apply_layout
    (params[:controller].include? "devise") ? "admin" : "application"
  end
end
