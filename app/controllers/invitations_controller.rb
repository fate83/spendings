class InvitationsController < ApplicationController
  before_action :set_invitation, only: %i[ destroy ]

  # GET /invitations or /invitations.json
  def index
    authorize(Invitation)
    @invitations = policy_scope(Invitation)
  end

  # GET /invitations/new
  def new
    authorize(Invitation)
    @invitation = Invitation.new
  end

  # POST /invitations or /invitations.json
  def create
    authorize(Invitation)
    @invitation = Invitation.new(invitation_params.merge(team: current_user.team, membership: current_user.membership))

    respond_to do |format|
      if @invitation.save
        InvitationMailer.email(@invitation).deliver_now
        format.html { redirect_to invitations_path, notice: "Invitation was successfully created." }
        format.json { render :show, status: :created, location: @invitation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1 or /invitations/1.json
  def destroy
    authorize(@invitation)
    @invitation.destroy!

    respond_to do |format|
      format.html { redirect_to invitations_path, status: :see_other, notice: "Invitation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def invitation_params
      params.expect(invitation: [ :email ])
    end
end
