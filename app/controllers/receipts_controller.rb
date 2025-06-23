class ReceiptsController < ApplicationController
  before_action :set_receipt, only: %i[ show edit update destroy ]

  # GET /receipts or /receipts.json
  def index
    authorize(Receipt)
    @receipts = policy_scope(Receipt).order(shopped_at: :desc)
  end

  # GET /receipts/1 or /receipts/1.json
  def show
    authorize(Receipt)
  end

  # GET /receipts/new
  def new
    authorize(Receipt)
    @receipt = Receipt.new
  end

  # GET /receipts/1/edit
  def edit
    authorize(@receipt)
  end

  # POST /receipts or /receipts.json
  def create
    authorize(Receipt)
    @receipt = Receipt.new(receipt_params.merge(team: current_user.team))

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to @receipt, notice: "Receipt was successfully created." }
        format.json { render :show, status: :created, location: @receipt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1 or /receipts/1.json
  def update
    authorize(@receipt)
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to @receipt, notice: "Receipt was successfully updated." }
        format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1 or /receipts/1.json
  def destroy
    authorize(@receipt)
    @receipt.destroy!

    respond_to do |format|
      format.html { redirect_to receipts_path, status: :see_other, notice: "Receipt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def receipt_params
      params.expect(receipt: [ :shopped_at, :shop_id ])
    end
end
