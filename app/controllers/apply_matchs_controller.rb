class ApplyMatchsController < ApplicationController
  def new
  end
  
  def create
    @matchreq = MatchReq.find_by(id: params[:id])
    @applymatch = ApplyMatch.new(team_info_id: @current_team.id,
                                  match_req_id: params[:id],
                                  status: 0,
                                  comment: params[:comment])
    @applymatch.save
    redirect_to("/matchs")
  end
  
  def update
    @applymatch = ApplyMatch.find_by(match_req_id: params[:id],team_info_id: params[:team_info_id])
    @applymatch.status = 1
    @applymatch.save
    
    @chatlink = ChatLink.create(room_id: @applymatch.match_req_id,team_info_id: @applymatch.team_info_id,)
    redirect_to("/matchs")
  end
  
  def destroy
  end
end
