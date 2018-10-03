class RoomsController < ApplicationController
      before_action :authenticate_team

  def index
    @rooms = Room.all
  end
  
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    if ChatLink.where(team_info_id: @current_team.id, room_id: @room.id).present?
    @messages = @room.messages
    @message = Message.new
    else
      flash[:alert] = "無効なユーザー"
      redirect_to action: 'index'
    end
  end
  
  def create
  end
  
  def edit
    @room = Room.find(params[:id])
  end
  
  def update
  end
end
