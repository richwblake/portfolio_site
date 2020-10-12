class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to root_url, notice: "Succesfully logged in"
    else
      redirect_to login_path, alert: "Authentication failed, please try again"
    end
  end

  def destroy
    sign_out
    redirect_to root_url, notice: "Successfully logged out, it's safe to close the window"
  end
end