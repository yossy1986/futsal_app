class TeamInfo < ApplicationRecord
    def matchreqs
        return MatchReq.where(team_id: self.id)
    end
end
