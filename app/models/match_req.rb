class MatchReq < ApplicationRecord
    belongs_to :team_info
    has_many :apply_matches, dependent: :destroy
    has_one :room, dependent: :destroy
    belongs_to :facility
    belongs_to :pref
    validates :content, presence: true
    validates :match_date, timeliness: { on_or_after: :now}

    def category
        Cat.find_by(id: self.req_cat)
    end

end
