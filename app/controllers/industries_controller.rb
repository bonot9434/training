class IndustriesController < ApplicationController
  
  def industry
  end
  
  def industry_show
    @users = User.where(industry_id: params[:industry_id])
  end
  
end
