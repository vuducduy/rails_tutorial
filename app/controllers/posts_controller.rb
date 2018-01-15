class PostsController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.creator = current_user
    if @post.save
      flash[:success]="Create successfully"
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    redirect_to root_url and return unless @post
    @comment = Comment.new
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :image_url)
    end

end
