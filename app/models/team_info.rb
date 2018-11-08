class TeamInfo < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30 },uniqueness: true
    validates :pref, presence: true
    validates :facility, presence: true
    validates :cat, presence: true
    validates :age_ave, presence: true
    validates :comment, presence: true
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: true
    validates :password, presence: true, length: { minimum: 6 },:confirmation => true
    validate :image_size
    validate :logo_size
      
    has_secure_password
    mount_uploader :image, ImageUploader
    mount_uploader :logo, LogoUploader
    
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end
    def logo_size
      if logo.size > 5.megabytes
        errors.add(:logo, "should be less than 5MB")
      end
    end
    
    has_many :match_reqs, dependent: :destroy
    has_many :apply_matches, dependent: :destroy
    has_many :messages, dependent: :destroy
    has_many :chat_links, dependent: :destroy
    belongs_to :pref
    belongs_to :facility
    belongs_to :cat

   
end
