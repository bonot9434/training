class SearchesController < ApplicationController

  def user_search
    @model=params[:model]
    @content=params[:content]
    if @model == 'user'
      @users = User.where('name LIKE ?', '%'+@content+'%')
    elsif @model == 'give'
      @users = User.where('give LIKE ?', '%'+@content+'%')
    elsif @model == 'take'
      @users = User.where('take LIKE ?', '%'+@content+'%')
    end
    render "users/index"
  end
  
  def followings_search
    @user = User.find(params[:user_id])
    @model = params[:model]
    @content = params[:content]
    if @model == 'user'
      @users = @user.followings.where('name LIKE ?', '%'+@content+'%')
    elsif @model == 'give'
      @users = @user.followings.where('give LIKE ?', '%'+@content+'%')
    elsif @model == 'take'
      @users = @user.followings.where('take LIKE ?', '%'+@content+'%')
    end
    render "relationships/followings"
  end

  def followers_search
    @user = User.find(params[:user_id])
    @model = params[:model]
    @content = params[:content]
    if @model == 'user'
      @users = @user.followers.where('name LIKE ?', '%'+@content+'%')
    elsif @model == 'give'
      @users = @user.followers.where('give LIKE ?', '%'+@content+'%')
    elsif @model == 'take'
      @users = @user.followers.where('take LIKE ?', '%'+@content+'%')
    end
    render "relationships/followers"
  end

  def search_tag
    @tag_list = Tag.all.order(name: "ASC")
    @tag = Tag.find(params[:tag_id])
    @tag_posts = @tag.posts
  end

end
