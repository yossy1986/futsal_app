class Facility < ApplicationRecord
    belongs_to :pref
    has_many :team_infos
    has_many :match_reqs

end
