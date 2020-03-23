class Content < ApplicationRecord
  belongs_to :creator
  validates :content, presence: true

  mount_uploader :video, VideoUploader
end
