class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]

  # GET /teams or /teams.json
  def index
    authorize(Team)
    @teams = policy_scope(Team)
  end

  # GET /teams/1 or /teams/1.json
  def show
    authorize(@team)
  end

  # GET /teams/new
  def new
    authorize(Team)
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
    authorize(@team)
  end

  # POST /teams or /teams.json
  def create
    authorize(Team)
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        Membership.create(user: current_user, team: @team, role_id: 1)
        format.html { redirect_to teams_path, notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    authorize(@team)

    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to teams_path, notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    authorize(@team)
    @team.destroy!

    respond_to do |format|
      format.html { redirect_to teams_path, status: :see_other, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def change
    if params[:team_id].present?
      team = current_user.teams.find(params[:team_id])
      authorize(team)
      current_user.update(team: team)
    end

    redirect_to request.referer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.expect(team: [ :name ])
    end
end
