class UsersController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]

  def show
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      sign_in user
      redirect_to root_url, notice: 'Sign up successful!'
    else
      redirect_to signup_path, alert: 'Sign up failed, please try again'
    end
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end