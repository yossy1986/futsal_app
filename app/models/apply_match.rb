class ApplyMatch < ApplicationRecord
    validates :comment, presence: true, length: { maximum: 130 }
    belongs_to :team_info
    belongs_to :match_req
end
