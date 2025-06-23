class ShopPolicy < ApplicationPolicy
  attr_reader :user, :shop

  def initialize(user, shop)
    @user = user
    @shop = shop
  end

  def index?
    true
  end
  alias :show? :index?
  alias :new? :index?
  alias :create? :index?

  def edit?
    user.team.shops.any?(shop)
  end
  alias :update? :edit?
  alias :destroy? :edit?


  class Scope < ApplicationPolicy::Scope
    def resolve
      # All shops of current team
      scope.where(id: user.team.shops)
    end
  end
end
