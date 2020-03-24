class Video < ApplicationRecord
  belongs_to :content

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
end
