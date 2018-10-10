class Facility < ApplicationRecord
    belongs_to :pref
    has_many :team_info
    has_many :match_reqs

end
