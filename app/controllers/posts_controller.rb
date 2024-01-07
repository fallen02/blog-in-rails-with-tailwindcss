class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  def index
    redirect_to '/'
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to '/'
  end

  def edit

  end

  def update
    puts "ping from update"
    if @post.update(post_params)
      redirect_to post_url(@post)
    end
  end

  def destroy
    @post.destroy!
    redirect_to '/'
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
