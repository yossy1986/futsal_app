class Pref < ApplicationRecord
    has_many :facilities
    has_many :team_infos
    has_many :match_reqs
end
