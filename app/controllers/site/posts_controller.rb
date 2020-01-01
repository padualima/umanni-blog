class Site::PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def show
    @comments = @post.comments.order(created_at: :desc)
    @comment = Comment.new
  end

  def comments
    # code
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
