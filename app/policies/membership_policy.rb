class MembershipPolicy < ApplicationPolicy
  attr_reader :user, :membership

  def initialize(user, membership)
    @user = user
    @membership = membership
  end

  def index?
    user.superadmin?
  end
  alias :show :index?
  alias :new :index?
  alias :edit :index?
  alias :create :index?
  alias :update :index?
  alias :destroy :index?

  def promote?
    user.admin? || user.superadmin?
  end

  def demote?
    user.superadmin?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
