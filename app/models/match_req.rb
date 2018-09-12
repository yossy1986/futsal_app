class MatchReq < ApplicationRecord
    def teaminfo
        return TeamInfo.find_by(id: self.team_id)
    end
end
