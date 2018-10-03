class SessionsController < ApplicationController
  before_action :authenticate_team,{only:[:destroy]}
  before_action :forbid_login_team,{only:[:new,:create]}

  def new
  end
  
  def create
    team = TeamInfo.find_by(email: params[:session][:email].downcase)
    if team && team.authenticate(params[:session][:password])
      log_in team
      flash[:notice] = "ログインしました(#{team.name})"
      redirect_to  matchs_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
