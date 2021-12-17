class PostsController < ApplicationController
  #a method in this class is called an action
  def index 
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to action: "index"
    else 
      render :new
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :author, :body)
  end
end