class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :creator
  belongs_to :content

  validates :body, presence: true, length: { maximum: 65_535 }
end
