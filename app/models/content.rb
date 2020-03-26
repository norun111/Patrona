class Content < ApplicationRecord
  belongs_to :creator
  has_one :image
  accepts_nested_attributes_for :image
  mount_uploader :image, ImageUploader
  mount_uploader :thumbnail, ThumbnailUploader
  mount_uploader :video, VideoUploader
end
