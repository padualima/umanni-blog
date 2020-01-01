class Site::PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def show
    @comments = @post.comments.order(created_at: :desc)
    @comment = Comment.new
  end

  def search
    @posts = Post.search(search_params[:q])
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def search_params
    params.permit(:q)
  end
end
