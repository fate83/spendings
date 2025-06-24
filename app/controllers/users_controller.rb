class UsersController < ApplicationController
  before_action :set_user, only: %i[ destroy promote demote ]
  def index
    authorize(User)
    @users = User.order(:id)
  end

  def destroy
    authorize(@user)
    @user.destroy
    redirect_to users_url
  end

  def promote
    authorize(@user)
    @user.update(superadmin: true)
    render turbo_stream: turbo_stream.update(
      "users", partial: "users/users", locals: { users: User.order(:id) }
    )
  end

  def demote
    authorize(@user)
    @user.update(superadmin: false)
    render turbo_stream: turbo_stream.update(
      "users", partial: "users/users", locals: { users: User.order(:id) }
    )
  end

  private
  def set_user
    @user = User.find(params.expect(:id))
  end
end
