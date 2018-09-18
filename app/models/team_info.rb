class TeamInfo < ApplicationRecord
    # validates :name, presence: true
    # validates :pref, presence: true
    # validates :facility, presence: true
    # validates :cat, presence: true
    # validates :age_ave, presence: true
    # validates :comment, presence: true
    # validates :email, presence: true
    # validates :password, presence: true
    def matchreqs
        return MatchReq.where(team_id: self.id)
    end

    scope :get_by_pref, ->(pref) {
    where(pref: pref)
    }

    scope :get_by_rank, ->(rank) {
    where(rank: rank)
    }
    # scope :get_by_cat, ->(cat) {
    # where(cat: cat)
    # }
end
