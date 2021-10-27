class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    like = @post.likes.new(user_id: current_user.id)
    like.save
    @likes = current_user.like_posts.pluck(:id)
    @like_post = Post.where(id: @likes)
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = @post.likes.find_by(user_id: current_user.id)
    like.destroy
    @likes = current_user.like_posts.pluck(:id)
    @like_post = Post.where(id: @likes)
  end

end
