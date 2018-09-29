class MessagesController < ApplicationController
  def create
    @message = Message.create(content: params[:message][:content],
                             team_info_id: @current_team.id,
                             room_id: params[:message][:room_id])
    redirect_to rooms_path
  end
end
