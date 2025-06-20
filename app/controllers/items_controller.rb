class ItemsController < ApplicationController
  before_action :set_item, only: %i[ update destroy ]

  # GET /items or /items.json
  def index
    @receipt = Receipt.find(params[:receipt_id])
    @items = @receipt.items
    @item = Item.new(receipt_id: @receipt.id)
  end

  # POST /items or /items.json
  def create
    @receipt = Receipt.find(params[:receipt_id])
    @category = Category.find_or_create_by!(name: params["item"]["category_name"])
    @items = @receipt.items
    @item = Item.new(item_params.merge(category_id: @category.id))

    respond_to do |format|
      if @item.save
        format.turbo_stream { render turbo_stream: turbo_stream.update("items", partial: "items/items", locals: { items: @items }) }
        format.html { redirect_to receipt_items_path(@receipt)}
        format.json { render :index, status: :created, location: @item }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @receipt = @item.receipt
    @item.destroy!

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@item) }
      format.html { receipt_items_path(@receipt) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.expect(item: [ :name, :price, :amount, :receipt_id, :category_id ])
    end
end
