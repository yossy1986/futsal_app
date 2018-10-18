class MatchsController < ApplicationController
  before_action :authenticate_team,{only:[:new,:create,:edit,:update,:destroy]}

  PER = 10
  def index
    @matchreqs = MatchReq.order(created_at: :desc).page(params[:page]).per(PER)
    @matchreq = MatchReq.new
    @week = Week
    if params[:id].present?
      @matchreqs = @matchreqs.where(pref_id: params[:match_req][:pref_id]) if params[:match_req][:pref_id].present?
      @matchreqs = @matchreqs.where(facility_id: params[:matchreq][:facility_id]) if params[:matchreq][:facility_id].present?
      @matchreqs = @matchreqs.where(req_cat: params[:match_req][:req_cat]) if params[:match_req][:req_cat].present?
    end
  end
  
  def get_facilities
    render partial: 'select_facilityy', locals: {pref_id: params[:pref_id]}
  end


  def show
    @matchreq = MatchReq.find_by(id: params[:id])
    @exdate = @matchreq.start_time - 12.hour
    @time = Time.now
    @accept = ApplyMatch.where(match_req_id: @matchreq.id).where(status: 1).count
    @remaining = @matchreq.req_team_num - @accept
    @week = Week
    @applymatchs = ApplyMatch.all
    @applymatch = ApplyMatch.new
    @applymatch_check = ApplyMatch.find_by(match_req_id: params[:id], team_info_id: session[:team_id])
  end
  
  def new
    @matchreq = MatchReq.new
  end
  
  def create
    @matchreq = MatchReq.new(team_info_id: @current_team.id,
                              match_date: params[:match_req][:match_date],
                              start_time: params[:match_req][:start_time],
                              end_time: params[:match_req][:end_time],
                              pref_id: params[:match_req][:pref],
                              facility_id: params[:match_req][:facility],
                              req_cat: params[:match_req][:req_cat],
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
    if @matchreq.save
    
      @room = Room.create(match_req_id: @matchreq.id)
      @chatlink = ChatLink.create(team_info_id: @current_team.id,room_id: @room.id)
      flash[:notice] = "対戦募集を作成しました"
      redirect_to action: "index"
    else
      render action: "new"
    end
  end
  
  def edit
    @matchreq = MatchReq.find_by(id: params[:id])
    @week = Week
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @matchreq = MatchReq.find_by(id: params[:id])
    @matchreq.match_date = params[:match_req][:match_date]
    @matchreq.start_time = params[:match_req][:start_time]
    @matchreq.end_time = params[:match_req][:end_time]
    @matchreq.pref_id = params[:match_req][:pref]
    @matchreq.facility_id = params[:match_req][:facility]
    @matchreq.req_cat = params[:match_req][:req_cat]
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
    if @matchreq.save
      flash[:notice] = "対戦募集を変更しました  "
      redirect_to action: "index"
    else
      render action: "edit"
    end
  end
  
  def destroy
    @matchreq = MatchReq.find_by(id: params[:id])
    @matchreq.destroy
    flash[:notice] = "対戦募集を削除しました "
    redirect_to action: 'index'
  end
end
