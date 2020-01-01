class Site::HomesController < ApplicationController
  def index
    @posts = Post.where(status: true).order(created_at: :DESC)
  end

  def about
    # code
  end
end
