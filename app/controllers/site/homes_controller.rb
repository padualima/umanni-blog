class Site::HomesController < ApplicationController
  def index
    @posts = Post.where(status: true).order(created_at: :DESC).page(params[:page]).per(10)
  end

  def about
    # code
  end
end
