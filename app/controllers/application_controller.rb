class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :success, :warning, :danger, :info
  def after_sign_in_path_for(resource)
    if current_user.role == 'guest'
      current_user_path
    else
      dashboard_path(current_user)
    end

  end
end
