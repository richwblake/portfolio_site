class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
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