class LikesController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    like = @post.likes.new(user_id: current_user.id)
    like.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = @post.likes.find_by(user_id: current_user.id)
    like.destroy
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end
  
end
