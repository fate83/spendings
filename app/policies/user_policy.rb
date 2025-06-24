class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
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
  alias :promote? :index?
  alias :demote? :index?

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
