class MatchsController < ApplicationController
  before_action :authenticate_team,{only:[:new,:create,:edit,:update,:destroy]}

  PER = 10
  def index
    @matchreqs = MatchReq.order(created_at: :desc).page(params[:page]).per(PER)
    @matchreq = MatchReq.new
    @week = Week
    if params[:id].present?
      @matchreqs = @matchreqs.where(pref_id: params[:match_req][:pref_id]) if params[:match_req][:pref_id].present?
      @selected_pref = params[:match_req][:pref_id]
      @matchreqs = @matchreqs.where(facility_id: params[:matchreq][:facility_id]) if params[:matchreq][:facility_id].present?
      @selected_facility = params[:matchreq][:facility_id]
      @facilitybox = Facility.where(params[:match_req][:pref_id]) if params[:match_req][:pref_id].present?
      @matchreqs = @matchreqs.where(req_cat: params[:match_req][:req_cat]) if params[:match_req][:req_cat].present?
      @selected_req_cat = params[:match_req][:req_cat]
    end
  end
  
  def get_facilities
    render partial: 'select_facilityy', locals: {pref_id: params[:pref_id]}
  end


  def show
    @matchreq = MatchReq.find_by(id: params[:id])
    @time = Time.now
    @exdate = @matchreq.match_date - 12.hours
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
    @selected_facility = params[:matchreq][:facility_id]
    @facilitybox = params[:match_req][:pref_id] if params[:match_req][:pref_id].present?
    @matchreq = MatchReq.new(team_info_id: @current_team.id,
                              match_date: params[:match_req][:match_date],
                              end_time: params[:match_req][:end_time],
                              pref_id: params[:match_req][:pref_id],
                              facility_id: params[:matchreq][:facility_id],
                              req_cat: params[:match_req][:req_cat],
                              req_team_num: params[:match_req][:req_team_num],
                              content: params[:match_req][:content])
    @matchreq.match_date = Time.zone.local(params[:match_req]["match_date(1i)"].to_i,
                                            params[:match_req]["match_date(2i)"].to_i,
                                            params[:match_req]["match_date(3i)"].to_i,
                                            params[:match_req]["match_date(4i)"].to_i,
                                            params[:match_req]["match_date(5i)"].to_i)
    @matchreq.end_time = Time.zone.local(params[:match_req]["end_time(1i)"].to_i,
                                          params[:match_req]["end_time(2i)"].to_i,
                                          params[:match_req]["end_time(3i)"].to_i,
                                          params[:match_req]["end_time(4i)"].to_i,
                                          params[:match_req]["end_time(5i)"].to_i)
    if @matchreq.save
      @room = Room.create(match_req_id: @matchreq.id)
      @chatlink = ChatLink.create(team_info_id: @current_team.id,room_id: @room.id)
      flash[:success] = "対戦募集を作成しました"
      redirect_to action: "index"
    else
      render action: "new"
    end
  end
  
  def edit
    @matchreq = MatchReq.find_by(id: params[:id])
    @week = Week
    @facilitybox = Facility.where(pref_id: @matchreq.pref_id)
    @selected_facility = @matchreq.facility_id
  end
  
  def update
    @selected_facility = params[:matchreq][:facility_id]
    @facilitybox = params[:match_req][:pref_id] if params[:match_req][:pref_id].present?
    @post = Post.find_by(id: params[:id])
    @matchreq = MatchReq.find_by(id: params[:id])
    @matchreq.match_date = params[:match_req][:match_date]
    @matchreq.end_time = params[:match_req][:end_time]
    @matchreq.pref_id = params[:match_req][:pref_id]
    @matchreq.facility_id = params[:matchreq][:facility_id]
    @matchreq.req_cat = params[:match_req][:req_cat]
    @matchreq.req_team_num = params[:match_req][:req_team_num]
    @matchreq.content = params[:match_req][:content]
    @matchreq.match_date = Time.zone.local(params[:match_req]["match_date(1i)"].to_i,
                                            params[:match_req]["match_date(2i)"].to_i,
                                            params[:match_req]["match_date(3i)"].to_i,
                                            params[:match_req]["match_date(4i)"].to_i,
                                            params[:match_req]["match_date(5i)"].to_i)
    @matchreq.end_time = Time.zone.local(params[:match_req]["end_time(1i)"].to_i,
                                          params[:match_req]["end_time(2i)"].to_i,
                                          params[:match_req]["end_time(3i)"].to_i,
                                          params[:match_req]["end_time(4i)"].to_i,
                                          params[:match_req]["end_time(5i)"].to_i)
    if @matchreq.save
      flash[:success] = "対戦募集を変更しました  "
      redirect_to action: "index"
    else
      render action: "edit"
    end
  end
  
  def destroy
    @matchreq = MatchReq.find_by(id: params[:id])
    @matchreq.destroy
    flash[:danger] = "対戦募集を削除しました "
    redirect_to action: 'index'
  end
end
