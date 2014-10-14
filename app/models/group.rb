class Group < ActiveRecord::Base
  has_many :users, through: :group_memberships
  validates :name, presence: true, uniqueness: true
end
