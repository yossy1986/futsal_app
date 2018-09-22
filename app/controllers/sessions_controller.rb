class SessionsController < ApplicationController
  def new
    @posts = Post.all.order(created_at: :desc)
  end
  def create
    team = TeamInfo.find_by(email: params[:session][:email].downcase)
    if team && team.authenticate(params[:session][:password])
      log_in team
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
