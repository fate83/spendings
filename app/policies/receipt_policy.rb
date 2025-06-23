class ReceiptPolicy < ApplicationPolicy
  attr_reader :user, :receipt

  def initialize(user, receipt)
    @user = user
    @receipt = receipt
  end

  def index?
    true
  end
  alias :show? :index?
  alias :new? :index?
  alias :create? :index?

  def edit?
    user.admin? && user.team.receipts.any?(receipt)
  end
  alias :update? :edit?
  alias :destroy? :edit?

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.where(id: user.team.receipts)
    end
  end
end
