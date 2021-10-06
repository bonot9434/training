class LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    like = @tweet.likes.new(user_id: current_user.id)
    like.save
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    like = @tweet.likes.find_by(user_id: current_user.id)
    like.destroy
  end
end
