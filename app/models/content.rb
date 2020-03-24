class Content < ApplicationRecord
  belongs_to :creator
  has_one :video
  validates :content, presence: true

  mount_uploader :video, VideoUploader
end
