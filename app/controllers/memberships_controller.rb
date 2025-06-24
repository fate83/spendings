class MembershipsController < ApplicationController
  before_action :set_membership, only: %i[ show edit update destroy promote demote ]
  before_action :set_team, only: %i[ index ]

  # GET /memberships or /memberships.json
  def index
    authorize(@team)
  end

  # GET /memberships/1 or /memberships/1.json
  def show
    authorize(Membership)
  end

  # GET /memberships/new
  def new
    authorize(Membership)
    @membership = Membership.new
  end

  # GET /memberships/1/edit
  def edit
    authorize(@membership)
  end

  # POST /memberships or /memberships.json
  def create
    authorize(Membership)
    @membership = Membership.new(membership_params)

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership, notice: "Membership was successfully created." }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1 or /memberships/1.json
  def update
    authorize(@membership)
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: "Membership was successfully updated." }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1 or /memberships/1.json
  def destroy
    authorize(@membership)
    @membership.destroy!

    respond_to do |format|
      format.html { redirect_to memberships_path, status: :see_other, notice: "Membership was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def promote
    authorize(@membership)
    @membership.update(role: Role.find(1))
    render turbo_stream: turbo_stream.update(
      "memberships", partial: "memberships/memberships", locals: { team: @membership.team }
    )
  end

  def demote
    authorize(@membership)
    @membership.update(role: Role.find(2))
    render turbo_stream: turbo_stream.update(
      "memberships", partial: "memberships/memberships", locals: { team: @membership.team }
    )
  end

  private
    def set_team
      @team = Team.find(params.expect(:team_id))
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def membership_params
      params.expect(membership: [ :team_id, :user_id, :role_id ])
    end
end
