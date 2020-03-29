class Content < ApplicationRecord
  belongs_to :creator
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  mount_uploader :image, ImageUploader
  mount_uploader :thumbnail, ThumbnailUploader
  mount_uploader :audio_image, ImageUploader
  mount_uploader :video, VideoUploader
  mount_uploader :audio, AudioFileUploader
end
