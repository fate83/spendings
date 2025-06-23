class Team < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :roles, through: :memberships

  def admins
    users.where(memberships: { role_id: 1 })
  end
end
