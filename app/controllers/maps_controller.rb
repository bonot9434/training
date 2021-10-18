class MapsController < ApplicationController

  def map
  end

  def map_show
    @users = User.where(prefecture_id: params[:prefecture_id])
    
  end

end
