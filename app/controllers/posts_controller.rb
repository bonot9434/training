class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       redirect_to post_path(@post)
    else
       render:edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:body, :image)
  end
  
end
