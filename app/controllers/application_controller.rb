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

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def redirect_if_logged_in
    if current_user
      redirect_to root_url
    end
  end

  def redirect_if_not_logged_in
    if !current_user
      redirect_to login_path, alert: 'Please log in to continue'
    end
  end

  def redirect_if_not_admin
    if !current_user.admin?
      redirect_to posts_path
    end
  end
end
