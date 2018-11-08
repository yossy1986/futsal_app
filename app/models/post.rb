class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validate :image_size
    
    mount_uploader :image, ImageUploader
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end
end
