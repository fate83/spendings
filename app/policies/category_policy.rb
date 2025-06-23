class CategoryPolicy < ApplicationPolicy
  attr_reader :user, :category

  def initialize(user:, category:)
    @user = user
    @category = category
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
