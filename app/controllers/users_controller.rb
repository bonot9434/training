class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :identification, only: [:edit]

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
    @following = @user.followings.pluck(:id)
    @follow_post = Post.where(user_id: @following)
    @likes = @user.like_posts.pluck(:id) #eachがnilにならないための記述
    @like_post = Post.where(id: @likes)
    @receiveUser = User.find(@user.id) #DM機能
    @roomId = current_user.get_room_id(@receiveUser)
    if @roomId.blank?
      @room = Room.new
      @RoomUser = RoomUser.new
    end
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

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end


  private

  def identification
    user = User.find(params[:id])
    if user != current_user
      redirect_to user_path
    end
  end


  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :give, :take, :industry_id, :prefecture_id)
  end
end
