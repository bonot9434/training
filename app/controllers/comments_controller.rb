class CommentsController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = current_user.comments.new(comment_params)
    @comment.tweet_id = @tweet.id
    if @comment.save
       redirect_to tweet_path(@tweet)
    else
       @user = @tweet.user
       render "tweets/show"
    end
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to tweet_path(params[:tweet_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
