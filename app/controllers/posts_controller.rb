class PostsController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:new, :create, :update, :destroy]
  before_action :redirect_if_not_admin, only: [:new, :create, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to posts_path
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end