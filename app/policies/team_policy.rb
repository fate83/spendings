class TeamPolicy < ApplicationPolicy
  attr_reader :team, :user

  def initialize(user, team)
    @user = user
    @team = team
  end

  def index?
    true
  end

  def show?
    team.users.any?(user) || user.superadmin?
  end

  def new?
    true
  end

  def edit?
    team.admins.any?(user) || user.superadmin?
  end

  def create?
    true
  end

  def update?
    team.admins.any?(user) || user.superadmin?
  end

  def destroy?
    team.admins.any?(user) || user.superadmin?
  end

  def change?
    team.users.any?(user) || user.superadmin?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.superadmin?
        scope.all
      else
        scope.includes(memberships: :role).where(memberships: { role_id: user.roles })
      end
    end
  end
end
