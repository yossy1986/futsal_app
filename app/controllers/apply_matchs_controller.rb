class ApplyMatchsController < ApplicationController
  before_action :authenticate_team

  def new
  end
  
  def create
    @matchreq = MatchReq.find_by(id: params[:id])
    @week = Week
    @applymatch = ApplyMatch.new(team_info_id: @current_team.id,
                                  match_req_id: params[:id],
                                  status: 0,
                                  comment: params[:comment])
    if  @applymatch.save
      flash[:success] = "応募しました"
      redirect_to("/matchs")
    else
      render("matchs/show")
    end
  end
  
  def update
    @matchreq = MatchReq.find_by(id: params[:id])
    @applymatch = ApplyMatch.find_by(match_req_id: params[:id],team_info_id: params[:team_info_id])
    @applymatch.status = 1
    if @applymatch.save
      @chatlink = ChatLink.new(room_id: @applymatch.match_req_id,team_info_id: @applymatch.team_info_id)
      @chatlink.save
      flash[:success] = "#{@applymatch.team_info.name}が参加しました"
      redirect_to("/matchs/#{@matchreq.id}")
    else
      render("matchs")
    end
  end
  
  def remove
    @matchreq = MatchReq.find_by(id: params[:id])
    @applymatch = ApplyMatch.find_by(match_req_id: params[:id],team_info_id: params[:team_info_id])
    @applymatch.status = 0
    if @applymatch.save
      @chatlink = ChatLink.find_by(room_id: @applymatch.match_req_id,team_info_id: @applymatch.team_info_id)
      @chatlink.destroy
      flash[:danger] = "#{@applymatch.team_info.name}を参加チームから外しました"
      redirect_to("/matchs/#{@matchreq.id}")
    else
      render("matchs")
    end
  end
  
  def destroy
  end
end
