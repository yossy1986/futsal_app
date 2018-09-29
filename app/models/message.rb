class Message < ApplicationRecord
    belongs_to :room
    belongs_to :team_info
end
