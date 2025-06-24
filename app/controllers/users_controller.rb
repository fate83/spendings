class UsersController < ApplicationController
  def index
    @team = Team.find(params[:id])
    authorize(@team)
  end

  def promote
    @user = User.find(params[:id])
    authorize(@user)
    @user.membership.update(role: Role.find(1))
    render turbo_stream: turbo_stream.replace("user_#{@user.id}", partial: "users/user", locals: { user: @user })
  end

  def demote
    @team = Team.find(params[:team_id])
    @user = User.find(params[:id])
    authorize(@user)
    Membership.find_by!(user: @user, team: @team).update(role: Role.find(2))
    render turbo_stream: turbo_stream.replace("user_#{@user.id}", partial: "users/user", locals: { user: @user })
  end
end
