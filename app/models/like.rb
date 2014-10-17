class Like < ActiveRecord::Base
  belongs_to :image
  belongs_to :user
  
  validates :user_id, uniqueness: { scope: :image }
end
