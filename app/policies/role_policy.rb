class RolePolicy < ApplicationPolicy
  attr_reader :user, :role

  def initialize(user, role)
    @user = user
    @role = role
  end

  def index?
    user.superadmin?
  end
  alias :show? :index?
  alias :new? :index?
  alias :edit? :index?
  alias :create? :index?
  alias :update? :index?
  alias :destroy? :index?

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
