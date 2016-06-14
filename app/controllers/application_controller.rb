class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_filter :set_user_time_zone

  def set_user_time_zone
    Time.zone = current_user.time_zone    
  end


  def after_sign_in_path_for(current_user)
    if current_user.admin?
      toolbar_admin_user_path(current_user)
    else
      new_search_path
    end
  end
end
