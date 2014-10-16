class Image < ActiveRecord::Base
  acts_as_taggable
  belongs_to :gallery
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :users, through: :likes
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
end
