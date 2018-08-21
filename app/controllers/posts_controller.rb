class PostsController < ApplicationController
  before_action :set_post, only: %i[show]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Your post was created sucessfully!'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale).merge(user: current_user)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
