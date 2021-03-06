class Game < ApplicationRecord
  belongs_to :user
  
  validates :title,presence:true,length: { maximum: 255 }
  validates :user_id, presence: true
  
end
