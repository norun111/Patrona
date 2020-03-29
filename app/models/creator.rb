class Creator < ApplicationRecord
  enum restriction: {no:1, prohibited:2}
  
  belongs_to :user

  has_many :contents

  def self.search(input, id)
    return nil if input == ""
    Creator.where(['creator_name LIKE ?', "%#{input}%"] ).where.not(id: id).limit(10)
  end
end
