class RelationshipsController < ApplicationController
  # user.rbに記述あり
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings.order("#{sort_column} #{sort_direction}")
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers.order("#{sort_column} #{sort_direction}")
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

end
