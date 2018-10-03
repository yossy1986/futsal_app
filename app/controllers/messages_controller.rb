class MessagesController < ApplicationController
  before_action :authenticate_team,{only:[:create]}

  def create
    @message = Message.create(content: params[:message][:content],
                             team_info_id: @current_team.id,
                             room_id: params[:message][:room_id])
    redirect_back(fallback_location: root_path)
  end
end
