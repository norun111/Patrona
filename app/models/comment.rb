class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :creator
  belongs_to :content
end
