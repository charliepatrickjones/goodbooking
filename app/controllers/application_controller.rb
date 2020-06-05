class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :warning, :danger, :info

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :name, :photo])
  end

  def after_sign_in_path_for(resource)
    if current_user.role == 'guest'
      user_path(current_user)
    else
      dashboard_path(current_user)
    end
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
