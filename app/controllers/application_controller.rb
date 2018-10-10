class ApplicationController < ActionController::Base
    before_action :set_current_team
    before_action :post_all
    
    def post_all
      @posts = Post.all.order(created_at: :desc)
    end
    
    def set_current_team
      if session[:team_id]
        @current_team = TeamInfo.find_by(id: session[:team_id])
      end
    end
    
    def authenticate_team
      if @current_team == nil
          flash[:notice] = "ログインが必要です"
          redirect_to("/login")
      end
    end
    
    def forbid_login_team
      if @current_team
        flash[:notice] = "すでにログインしています"
        redirect_to matchs_path
      end
    end
    
    private
    def admin_team
      redirect_to("/matchs") unless set_current_team.admin?
    end
    
    include SessionsHelper
    
    Week = ["日", "月", "火", "水", "木", "金", "土"]
    
end
