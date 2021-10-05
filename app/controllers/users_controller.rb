class UsersController < ApplicationController

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :give, :take, :industry, :is_deleted)
  end

end
