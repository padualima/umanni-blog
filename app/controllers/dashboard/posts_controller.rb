class Dashboard::PostsController < DashboardController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.where(status: true, user_id: current_user.id).order(created_at: :DESC)
  end

  def new
    @post = Post.new
    prepare_form
  end

  def show
    @comments = @post.comments.order(created_at: :desc)
    @comment = Comment.new
  end

  def edit
    prepare_form
  end

  def inactive
    @posts = Post.where(status: false, user_id: current_user.id).order(created_at: :DESC)
  end

  def create
    @post = Post.new(post_params)
    @post.update(user_id: current_user.id)

    if @post.save
      redirect_to dashboard_posts_path
    else
      render :new
      prepare_form
    end
  end

  def update
    if @post.update(post_params)
      if @post.status == true
        redirect_to dashboard_posts_path
      else
        redirect_to dashboard_posts_inactive_path
      end
    else
      render :edit
      prepare_form
    end
  end

  def destroy
    @post.destroy
    redirect_to dashboard_posts_path
  end

  private

  def prepare_form
    @categories = Category.all.map { |catg| [catg.description, catg.id] }
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :subtitle, :body, :category_id, :user_id, :status, :content)
  end
end
