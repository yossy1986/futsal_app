class MatchReq < ApplicationRecord
    belongs_to :team_info
    has_many :apply_matches
    validates :content, presence: true
    def team
        TeamInfo.find_by(id: self.team_info_id)
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
