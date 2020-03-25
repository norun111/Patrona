class Video < ApplicationRecord
  
  validates :title, :video, :presence => true

  mount_uploader :video, VideoUploader
  mount_uploader :image, ImageUploader
end
