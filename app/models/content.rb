class Content < ApplicationRecord
  belongs_to :creator
  
  mount_uploader :image, ImageUploader
  mount_uploader :thumbnail, ThumbnailUploader
  mount_uploader :video, VideoUploader
end
