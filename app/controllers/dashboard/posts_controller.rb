class Dashboard::PostsController < DashboardController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.where(status: true)
  end

  def new
    @post = Post.new
  end

  def show
    
  end

  def edit
    # code
  end

  def inactive
    @posts = Post.where(status: false)
  end

  def create
    @post = Post.new(post_params)
    @post.update(user_id: current_user.id)
    if @post.save
      redirect_to dashboard_posts_path
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to dashboard_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to dashboard_posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :subtitle, :body, :category_id, :user_id, :status, :content)
  end
end
