class Perk < ApplicationRecord
  validates :amount, :numericality => { :only_interger => true }  # 数字のみで構成されているか
  validates :amount, :numericality => { :greater_than_or_equal_to => 100 }  # 数字が100以上であるか
  validates :amount, :numericality => { :less_than_or_equal_to => 9999999 }     # 数字が9999999以下であるか

  mount_uploader :image, ImageUploader
  belongs_to :creator
  belongs_to :user
  has_rich_text :description
end
