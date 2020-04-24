class Creator < ApplicationRecord
  enum restriction: {no:1, prohibited:2}
  enum dm_permission: {free: 1, patron_only: 2}
  # validates :dm_permission, inclusion: {in: ["free", "patron_only"]}

  belongs_to :user
  has_many :contents, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :perks, dependent: :destroy

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  mount_uploader :thumbnail, ThumbnailUploader
  has_rich_text :description

  def self.search(input, id)
    return nil if input == ""
    Creator.where(['creator_name LIKE ?', "%#{input}%"] ).where.not(id: id).limit(10)
  end
  
end
