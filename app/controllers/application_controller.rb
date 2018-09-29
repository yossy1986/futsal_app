class ApplicationController < ActionController::Base
    before_action :set_current_team
    before_action :post_all
    
    def post_all
      @posts = Post.all.order(created_at: :desc)
    end
    
    def set_current_team
        @current_team = TeamInfo.find_by(id: session[:team_id])
    end
    
    include SessionsHelper
    
    Week = ["日", "月", "火", "水", "木", "金", "土"]
    
end
