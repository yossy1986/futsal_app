class ApplicationController < ActionController::Base
    before_action :set_current_team
    def set_current_team
        @current_team = TeamInfo.find_by(id: session[:team_id])
    end
    include SessionsHelper
    Week = ["日", "月", "火", "水", "木", "金", "土"]
    def index
         
    end
    
    
end
