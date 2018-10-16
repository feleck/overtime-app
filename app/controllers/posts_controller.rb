class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy approve]

  def index
    @posts = Post.posts_by(current_user).page(params[:page]).per(10)
  end

  def approve
    authorize @post
    @post.approved!
    redirect_to root_path, notice: 'The post has been approved'
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: 'Your post was created sucessfully!'
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: 'Your post was updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: 'Your post was deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale, :status, :daily_hours)
    # .merge(user: current_user) - not using it, because after editin by admin - creatror is also changeging
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
