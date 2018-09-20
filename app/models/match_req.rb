class MatchReq < ApplicationRecord
    def team
        return TeamInfo.find_by(id: self.team_id)
    end
    def court
        Facility.find_by(id: self.facility)
    end
    def category
        Cat.find_by(id: self.req_cat)
    end
    def ranking
        Rank.find_by(id: self.req_rank)
    end

end
