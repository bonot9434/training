class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
    @following = @user.followings.pluck(:id)
    @follow_post = Post.where(user_id: @following)
  end

  def index
    @users = User.order("#{sort_column} #{sort_direction}")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user)
    else
       render:edit
    end
  end

  def likes
    @user = User.find(params[:id])
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : 'prefecture_id'
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :give, :take, :industry_id, :prefecture_id)
  end
end
