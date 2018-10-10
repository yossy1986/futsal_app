class ChatLink < ApplicationRecord
    belongs_to :team_info
    belongs_to :room, optional: true
    
end
