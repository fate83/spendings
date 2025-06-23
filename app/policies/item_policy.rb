class ItemPolicy < ApplicationPolicy
  attr_reader :user, :item

  def initialize(user, item)
    @user = user
    @item = item
  end

  def index?
    true
  end
  alias :create? :index?

  def destroy?
    user.team.receipts.any?(item.receipt)
  end



  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.joins(receipt: :team).where(receipt: { team: user.team })
    end
  end
end
