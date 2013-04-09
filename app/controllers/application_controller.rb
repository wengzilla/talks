class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :store_location

  def after_sign_in_path_for(resource)
    return_to = get_return_to(talks_path)
    clear_stored_location
    return_to
  end

private
  def set_full_width
    @full_width = true
  end

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access that page."
      redirect_to new_user_session_path
    end
  end

  def store_location
    # raise request.inspect
    session[:return_to] = request.fullpath
  end

  def clear_stored_location
    session[:return_to] = nil
  end

  def get_return_to(alternate=nil)
    session[:return_to] || alternate || root_path
  end
end
