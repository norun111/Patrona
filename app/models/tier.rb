class Tier < ApplicationRecord
  validates :price, :numericality => { :only_interger => true }  # 数字のみで構成されているか
  validates :price, :numericality => { :greater_than_or_equal_to => 100 }  # 数字が100以上であるか
  validates :price, :numericality => { :less_than_or_equal_to => 9999999 }     # 数字が9999999以下であるか

  mount_uploader :image, ImageUploader
  
end
