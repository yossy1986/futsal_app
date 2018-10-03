class Message < ApplicationRecord
    validates :content, presence: true
    belongs_to :room
    belongs_to :team_info
end
