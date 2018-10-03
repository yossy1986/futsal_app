class ApplyMatch < ApplicationRecord
    validates :comment, presence: true, length: { maximum: 150 }
    belongs_to :team_info
    belongs_to :match_req
end
