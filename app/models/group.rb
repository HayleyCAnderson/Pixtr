class Group < ActiveRecord::Base
  has_many :group_memberships, dependent: :destroy
  has_many :users, through: :group_memberships
  validates :name, presence: true, uniqueness: true

  def add_member(user)
    users << user
  end

  def remove_member(user)
    users.delete(user)
  end
end
