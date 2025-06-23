class Team < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :roles, through: :memberships
  has_many :shops, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :receipts, dependent: :destroy
  has_many :invitations, dependent: :destroy

  def admins
    users.where(memberships: { role_id: 1 })
  end
end
