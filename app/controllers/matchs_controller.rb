class MatchsController < ApplicationController
  def index
    @matchreqs = MatchReq.all.order(created_at: :desc)
    @posts = Post.all.order(created_at: :desc)
    @week = Week
    @rank = Rank
    @cat = Cat
    @pref = Pref
  end

  def show
    @week = Week
    @rank = Rank
    @cat = Cat
    @pref = Pref
    @matchreq = MatchReq.find_by(id: params[:id])
    @team = @matchreq.team
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
    @posts = Post.all.order(created_at: :desc)
    @matchreq = MatchReq.new
  end
  
  def create
    @matchreq = MatchReq.new(match_date: params[:match_date][:date],
                              start_time: params[:match_req][:start_time],
                              end_time: params[:match_req][:end_time],
                              pref: params[:match_req][:pref],
                              facility: params[:match_req][:facility],
                              req_cat: params[:match_req][:req_cat],
                              req_rank: params[:match_req][:req_rank],
                              req_team_num: params[:match_req][:req_team_num],
                              content: params[:match_req][:content])
    @matchreq.save
    redirect_to action: "index"
  end
end
