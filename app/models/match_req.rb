class MatchReq < ApplicationRecord
    belongs_to :team_info
    has_many :apply_matches, dependent: :destroy
    has_one :room, dependent: :destroy
    belongs_to :facility
    validates :content, presence: true

    def category
        Cat.find_by(id: self.req_cat)
    end
    def ranking
        Rank.find_by(id: self.req_rank)
    end
    
    def serch
      if params[:match_req][:pref].present?
        @result = MatchReq.where(pref: params[:match_req][:pref])
      end
    end

end
