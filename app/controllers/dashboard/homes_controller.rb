class Dashboard::HomesController < DashboardController
  def index
    @posts_published = Post.where(status: true, user_id: current_user.id)
    @posts_inactived = Post.where(status: true, user_id: current_user.id)
    @post_active = Post.where(status: true, user_id: current_user.id)
    @comments = Comment.where(post: @post_active)
  end
end
