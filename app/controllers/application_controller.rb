class ApplicationController < ActionController::Base
  protect_from_forgery
  include SimpleCaptcha::ControllerHelpers
  def after_sign_in_path_for(resource)
    admins_path
  end
end
