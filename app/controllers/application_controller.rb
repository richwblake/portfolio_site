class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: [session[:user_id]])
    else
      puts 'current user is nil'
      @current_user = nil
    end
  end

  def redirect_if_logged_in
    if current_user
      puts 'redirecting from helper'
      puts session[:user_id]
      redirect_to root_url
    end
  end
end
