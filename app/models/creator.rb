class Creator < ApplicationRecord
  enum restriction: {no:1, prohibited:2}
  
  belongs_to :user

end
