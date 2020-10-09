class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: [session[:user_id]])
    else
      @current_user = nil
    end
  end

  def logged_in?
    current_user ? true : false
  end

  def redirect_if_logged_in
    if current_user
      redirect_to root_url
    end
  end

  def redirect_if_not_logged_in
    if !current_user
      redirect_to posts_path
    end
  end

  def redirect_if_not_admin
    if !current_user.admin?
      redirect_to posts_path
    end
  end
end
