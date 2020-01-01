class Dashboard::CommentsController < ApplicationController
  def create
    comment = Comment.create!(comments_params)
    redirect_to dashboard_post_path(comment.post), notice: 'O seu comentário foi enviado.'
  end

  private

  def comments_params
    params.require(:comment).permit(:post_id, :user_id, :body)
  end
end
