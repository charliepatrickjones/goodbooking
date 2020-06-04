class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :success, :warning, :danger, :info
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
