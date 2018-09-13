class MatchReq < ApplicationRecord
    def team
        return TeamInfo.find_by(id: self.team_id)
    end
end
