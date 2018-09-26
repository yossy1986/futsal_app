class ApplyMatchsController < ApplicationController
  def new
    @posts = Post.all.order(created_at: :desc)
  end
  
  def create
    @applymatch = ApplyMatch.new(team_info_id: @current_team.id,
                                  match_req_id: 1,
                                  status: 0,
                                  comment: params[:apply_match][:comment])
    @applymatch.save
    redirect_to("/matchs")
  end
  
  def destroy
  end
end
