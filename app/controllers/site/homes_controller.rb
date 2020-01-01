class Site::HomesController < ApplicationController
  def index
    @posts = Post.where(status: true)
  end
end
