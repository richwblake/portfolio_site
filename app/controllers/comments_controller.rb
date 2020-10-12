class CommentsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.post = post
    comment.save
    redirect_to post_path(post), notice: "Thank you for commenting!"
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end