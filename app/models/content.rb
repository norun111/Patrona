class Content < ApplicationRecord
  belongs_to :creator
  has_many :comments, foreign_key: :content_id, dependent: :destroy
  
  has_many :content_perks, dependent: :destroy
  has_many :perks, through: :content_perks
  accepts_nested_attributes_for :content_perks

  # validates :image, presence: true
  # validates :image_title, presence: true
  # validates :video,presence: true, if: -> { video_url.blank? }
  # validates :video_url,presence: true, if: -> { video.blank? }
  # validates :video_title, presence: true
  # validates :audio, presence: true
  # validates :audio_image, presence: true
  # validates :audio_title, presence: true

  
  mount_uploader :image, ImageUploader
  mount_uploader :thumbnail, ThumbnailUploader
  mount_uploader :audio_image, ImageUploader
  mount_uploader :video, VideoUploader
  mount_uploader :audio, AudioFileUploader
end
