class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @groceries = Grocery.all
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create

    @order = Order.new(order_params)

    get_quantities.each do |q|
      @order.order_items.build(
        grocery_id: q[:grocery_id], 
        quantity: q[:quantity]
      )
    end

    if @order.save
      redirect_to order_review_path(@order)
    else
      render :new
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # GET /orders/1/review/ 
  def review
    order = Order.find_by_id(params[:order_id])
    @order_items = order.order_items.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).except(:quantities).permit(:preferences, :quantities)
    end

    def get_quantities
      quantities = []
      params[:order][:quantities].each do |grocery_id, quantity|
        quantities << { grocery_id: grocery_id, quantity: quantity }
      end
      quantities
    end
end
