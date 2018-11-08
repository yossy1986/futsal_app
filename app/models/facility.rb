class Facility < ApplicationRecord
    belongs_to :pref
    has_many :team_infos
    has_many :match_reqs
    
    validate :image_size
    
    mount_uploader :image, ImageUploader
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end

end
