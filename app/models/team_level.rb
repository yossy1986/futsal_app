class TeamLevel < ApplicationRecord
    validates :attack, presence: true
    validates :physical, presence: true
    validates :stamina, presence: true
    validates :defense, presence: true
    validates :tactics, presence: true
    validates :technique, presence: true
end
