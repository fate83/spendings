class InvitationPolicy < ApplicationPolicy
  attr_reader :user, :invitation

  def initialize(user, invitation)
    @user = user
    @invitation = invitation
  end

  def index?
    true
  end
  alias :new? :index?
  alias :create? :index?

  def destroy?
    if user.admin?
      user.team.invitations.any?(invitation)
    else
      user.invitations.any?(invitation)
    end
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.where(id: user.team.invitations)
      else
        scope.where(id: user.invitations)
      end
    end
  end
end
