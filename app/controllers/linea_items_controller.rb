class LineaItemsController < ApplicationController
  before_action :set_linea_item, only: [:show, :edit, :update, :destroy]
  before_action :set_order, only: [:create, :index]
  before_action :set_to_delete, only: [:destroy]

  # GET /linea_items
  # GET /linea_items.json
  def index
    if @order
      @linea_items = @order.linea_items.all
    end
  end

  # GET /linea_items/1
  # GET /linea_items/1.json
  def show
  end

  # GET /linea_items/new
  def new
    @linea_item = LineaItem.new
  end

  # GET /linea_items/1/edit
  def edit
  end
# customer_order_linea_items_path(:customer_id => @customer, :order_id => order)
# order_products_path(customer_id: params[:customer_id], order_id: params[:order_id])
  # POST /linea_items
  # POST /linea_items.json
  def create
    product = Product.find(params[:product_id])
    @linea_item = @order.add_product(product)

    respond_to do |format|
      if @linea_item.save
        format.html { redirect_to customers_url, notice: 'Linea item was successfully created.' }
        format.json { render :show, status: :created, location: @linea_item }
      else
        format.html { render :new }
        format.json { render json: @linea_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linea_items/1
  # PATCH/PUT /linea_items/1.json
  def update
    respond_to do |format|
      if @linea_item.update(linea_item_params)
        format.html { redirect_to @linea_item, notice: 'Linea item was successfully updated.' }
        format.json { render :show, status: :ok, location: @linea_item }
      else
        format.html { render :edit }
        format.json { render json: @linea_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linea_items/1
  # DELETE /linea_items/1.json
  # customer_order_linea_items_path(:customer_id => @customer, :order_id => order)
  def destroy
    @linea_item.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Item eliminado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linea_item
      @linea_item = LineaItem.find(params[:id])
    end

    def set_order
      @order = Order.find(params[:order_id])
    end

    def set_to_delete
      @linea_item = LineaItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def linea_item_params
      params.require(:linea_item).permit(:product_id, :order_id)
    end
end
