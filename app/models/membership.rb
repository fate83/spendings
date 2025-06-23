class Membership < ApplicationRecord
  belongs_to :team
  belongs_to :user
  belongs_to :role

  has_many :invitations, dependent: :destroy
end
