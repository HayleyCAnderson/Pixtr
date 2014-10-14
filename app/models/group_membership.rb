class GroupMembership < ActiveRecord::Base
  belongs_to :groups
  belongs_to :users
  validates :user_id, uniqueness: { scope: :group }
end
