class TeamInfo < ApplicationRecord
    validates :name, presence: true, length: { maximum: 25 },uniqueness: true
    validates :pref, presence: true
    validates :facility, presence: true
    validates :cat, presence: true
    validates :age_ave, presence: true
    validates :comment, presence: true
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: true
    validates :password, presence: true
      
     has_secure_password
     has_many :match_reqs
     has_many :apply_matches

    def court
        Facility.find_by(id: self.facility)
    end
    def category
        Cat.find_by(id: self.cat)
    end
    def ranking
        Rank.find_by(id: self.rank)
    end
    def prefecture
        Pref.find_by(id: self.pref)
    end
    
   
end
