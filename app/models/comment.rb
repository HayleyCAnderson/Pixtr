class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  
  validates :contents, presence: true
end