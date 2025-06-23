class TeamPolicy < ApplicationPolicy
  attr_reader :user, :team

  def initialize(user, membership)
    @user = user
    @team = membership
  end

  def index?
    true
  end
  alias :new? :index?
  alias :create? :index?
  alias :change? :index?

  def show?
    user.teams.any?(team) || user.superadmin?
  end

  def edit?
    user.admin? || user.superadmin?
  end
  alias :update? :edit?
  alias :destroy? :edit?

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.superadmin?
        scope.all
      else
        scope.where(id: user.team_ids)
      end
    end
  end
end
