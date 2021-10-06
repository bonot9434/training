class TweetsController < ApplicationController

  def show
  end

  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to tweets_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def tweet_params
    params.require(:tweet).permit(:body, :image)
  end

end