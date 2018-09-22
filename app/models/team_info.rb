class TeamInfo < ApplicationRecord
    # validates :name, presence: true
    # validates :pref, presence: true
    # validates :facility, presence: true
    # validates :cat, presence: true
    # validates :age_ave, presence: true
    # validates :comment, presence: true
    # validates :email, presence: true
    # validates :password, presence: true
      has_secure_password

    def matchreqs
        return MatchReq.where(team_id: self.id)
    end
    def court
        Facility.find_by(id: self.facility)
    end
    def category
        Cat.find_by(id: self.cat)
    end
    def ranking
        Rank.find_by(id: self.rank)
    end
    def prefecture
        Pref.find_by(id: self.pref)
    end


end
