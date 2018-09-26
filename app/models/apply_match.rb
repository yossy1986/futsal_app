class ApplyMatch < ApplicationRecord
    belongs_to :team_info
    belongs_to :match_req
    def team
        TeamInfo.find_by(id: self.team_info_id)
    end
end
