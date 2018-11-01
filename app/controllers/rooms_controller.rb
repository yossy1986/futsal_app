class RoomsController < ApplicationController
      before_action :authenticate_team
      before_action :admin_team,{only:[:edit,:update,:destroy]}
      

  def index
    @rooms = Room.all
  end
  
  def show
    @room = Room.find(params[:id])
    @m = Message.find_by(room_id: params[:id],team_info_id: 1)
    if ChatLink.where(team_info_id: @current_team.id, room_id: @room.id).present? || session[:team_id] == 1
    @messages = @room.messages.order(created_at: :desc)
    @message = Message.new
    else
      flash[:danger] = "無効なユーザー"
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
  
  def destroy
  end
end
