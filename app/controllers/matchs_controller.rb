class MatchsController < ApplicationController
  def index
    @matchreqs = MatchReq.all.order(created_at: :desc)
    @posts = Post.all.order(created_at: :desc)
    @matchreq = MatchReq.new
    @week = Week
  end

  def show
    @matchreq = MatchReq.find_by(id: params[:id])
    @team = @matchreq.team
    @posts = Post.all.order(created_at: :desc)
    @week = Week
    @applymatchs = ApplyMatch.all
    @applymatch = ApplyMatch.new
  end
  
  def new
    @posts = Post.all.order(created_at: :desc)
    @matchreq = MatchReq.new
  end
  
  def create
    @matchreq = MatchReq.new(team_info_id: @current_team.id,
                              match_date: params[:match_req][:match_date],
                              start_time: params[:match_req][:start_time],
                              end_time: params[:match_req][:end_time],
                              pref: params[:match_req][:pref],
                              facility: params[:match_req][:facility],
                              req_cat: params[:match_req][:req_cat],
                              req_rank: params[:match_req][:req_rank],
                              req_team_num: params[:match_req][:req_team_num],
                              content: params[:match_req][:content])
    @matchreq.match_date = Time.zone.local(params[:match_req]["match_date(1i)"].to_i,
                                            params[:match_req]["match_date(2i)"].to_i,
                                            params[:match_req]["match_date(3i)"].to_i,
                                            params[:match_req]["match_date(4i)"].to_i,
                                            params[:match_req]["match_date(5i)"].to_i)
    @matchreq.start_time = Time.zone.local(params[:match_req]["start_time(1i)"].to_i,
                                            params[:match_req]["start_time(2i)"].to_i,
                                            params[:match_req]["start_time(3i)"].to_i,
                                            params[:match_req]["start_time(4i)"].to_i,
                                            params[:match_req]["start_time(5i)"].to_i)
    @matchreq.end_time = Time.zone.local(params[:match_req]["end_time(1i)"].to_i,
                                          params[:match_req]["end_time(2i)"].to_i,
                                          params[:match_req]["end_time(3i)"].to_i,
                                          params[:match_req]["end_time(4i)"].to_i,
                                          params[:match_req]["end_time(5i)"].to_i)
    @matchreq.save
    redirect_to action: "index"
  end
  
  def edit
    @posts = Post.all.order(created_at: :desc)
    @matchreq = MatchReq.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @matchreq = MatchReq.find_by(id: params[:id])
    @matchreq.match_date = params[:match_req][:match_date]
    @matchreq.start_time = params[:match_req][:start_time]
    @matchreq.end_time = params[:match_req][:end_time]
    @matchreq.pref = params[:match_req][:pref]
    @matchreq.facility = params[:match_req][:facility]
    @matchreq.req_cat = params[:match_req][:req_cat]
    @matchreq.req_rank = params[:match_req][:req_rank]
    @matchreq.req_team_num = params[:match_req][:req_team_num]
    @matchreq.content = params[:match_req][:content]
    @matchreq.match_date = Time.zone.local(params[:match_req]["match_date(1i)"].to_i,
                                            params[:match_req]["match_date(2i)"].to_i,
                                            params[:match_req]["match_date(3i)"].to_i,
                                            params[:match_req]["match_date(4i)"].to_i,
                                            params[:match_req]["match_date(5i)"].to_i)
    @matchreq.start_time = Time.zone.local(params[:match_req]["start_time(1i)"].to_i,
                                            params[:match_req]["start_time(2i)"].to_i,
                                            params[:match_req]["start_time(3i)"].to_i,
                                            params[:match_req]["start_time(4i)"].to_i,
                                            params[:match_req]["start_time(5i)"].to_i)
    @matchreq.end_time = Time.zone.local(params[:match_req]["end_time(1i)"].to_i,
                                          params[:match_req]["end_time(2i)"].to_i,
                                          params[:match_req]["end_time(3i)"].to_i,
                                          params[:match_req]["end_time(4i)"].to_i,
                                          params[:match_req]["end_time(5i)"].to_i)
    @matchreq.save
    redirect_to action: "index"
  end
  
  def destroy
    @matchreq = MatchReq.find_by(id: params[:id])
    @matchreq.destroy
    redirect_to action: 'index'
  end
end
