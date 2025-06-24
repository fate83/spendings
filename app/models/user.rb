class User < ApplicationRecord
  # Include default users modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :trackable

  belongs_to :team
  alias :current_team :team

  has_many :memberships, dependent: :destroy
  has_many :teams, through: :memberships
  has_many :roles, through: :memberships
  has_many :invitations, through: :memberships

  def admin?
    admin_membership = Membership.includes(:role).find_by(user: self, team: team)
    admin_membership.role_id == 1 && admin_membership.role.name == "Administrator"
  end

  def superadmin?
    !!superadmin
  end

  def membership
    Membership.find_by(user: self, team: current_team)
  end
  alias :current_membership :membership

  def role
    membership.role
  end
end
