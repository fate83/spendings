class ItemsController < ApplicationController
  before_action :set_item, only: %i[ destroy ]
  before_action :set_receipt, only: %i[ index create ]

  def tom_search
    authorize(Item)
    query = params[:query] || ""
    return nil if query.blank? || query.size < 3

    @items = Item.joins(receipt: :team).where("LOWER(items.name) like LOWER(?)", "%#{query}%")
    render formats: :json
  end

  # GET /items or /items.json
  def index
    authorize(@receipt)
    authorize(Item)
    @items = @receipt.items
    @item = Item.new(receipt_id: @receipt.id)
  end

  # POST /items or /items.json
  def create
    authorize(@receipt)
    authorize(Item)
    @category = current_user.team.categories.find_or_create_by!(name: params["item"]["category_name"])
    @items = @receipt.items
    @item = Item.new(item_params.merge(category_id: @category.id))

    respond_to do |format|
      if @item.save
        format.turbo_stream { render turbo_stream: turbo_stream.update("items", partial: "items/items", locals: { items: @items }) }
        format.html { redirect_to receipt_items_path(@receipt) }
        format.json { render :index, status: :created, location: @item }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    authorize(@item)
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
    def set_receipt
      @receipt = Receipt.find(params.expect(:receipt_id))
    end

    def set_item
      @item = Item.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.expect(item: [ :name, :price, :amount, :receipt_id, :category_id ])
    end
end
