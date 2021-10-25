class RoomsController < ApplicationController

  def index
    @dm_users = current_user.get_dm_users
  end

  def show
    @dm_users = current_user.get_dm_users
    @room = Room.find(params[:id])
    if @room.present?
      if RoomUser.where(user_id: current_user.id, room_id: @room.id).present?
        @messages = @room.messages.order(id: "DESC")
        @message = Message.new
        @RoomUsers = @room.room_users
      else
        redirect_to rooms_path
      end
    end
  end

  def create
    @room = Room.create
    @joinCurrentUser = RoomUser.create(user_id: current_user.id, room_id: @room.id)
    @joinUser = RoomUser.create(join_room_params)
    redirect_to room_path(@room.id)
  end

  private

  def join_room_params
    params.require(:room_user).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
