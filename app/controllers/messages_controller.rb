class MessagesController < ApplicationController
  before_action :authenticate_team,{only:[:create]}

  def create
    @message = Message.create(content: params[:message][:content],
                             team_info_id: @current_team.id,
                             room_id: params[:message][:room_id])
    redirect_back(fallback_location: root_path)
  end
  
  def show
    @message = Message.find_by(id: params[:id])
  end
  
  def edit
    @message = Message.find_by(id: params[:id])
  end
  
  def update
    @message = Message.find_by(id: params[:id])
    @message.content = params[:message][:content]
    if @message.save
      redirect_to("/rooms/#{@message.room_id}")
    else
      render action: "show"
    end
  end
  
  def destroy
    @message = Message.find_by(id: params[:id])
    @message.destroy
    redirect_to("/rooms/#{@message.room_id}")
  end
end
