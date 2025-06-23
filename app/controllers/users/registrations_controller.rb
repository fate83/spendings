# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_after_action :verify_authorized
  skip_before_action :require_no_authentication

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    if params[:token].present?
      @invitation = Invitation.find_by!(token: params[:token])
      if @invitation.accepted?
        redirect_to new_user_session_path, alert: "Invalid invitation token"
      else
        @user = User.find_or_initialize_by(email: @invitation.email)
        if @user.persisted?
          @membership = Membership.find_or_initialize_by(team: @invitation.team, user: @user, role: Role.find(2))
          if @membership.persisted?
            redirect_to root_path, notice: "You are already on that team"
          else
            @membership.save!
            @user.update(team: @invitation.team)
            @invitation.update(accepted_at: Time.zone.now)
            redirect_to root_path, notice: "Welcome to #{@invitation.team.name}!"
          end
        end
      end
    else
      redirect_to new_user_session_path, alert: "Invalid invitation token"
    end
  end

  # POST /resource
  def create
    super
    @invitation = Invitation.find_by! email: @user.email
    Membership.create!(team: @invitation.team, user: @user, role: Role.find(2))
    @user.update(team: @invitation.team)
    @invitation.update(accepted_at: Time.zone.now)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
