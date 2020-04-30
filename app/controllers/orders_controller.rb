class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
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
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  # GET /orders/1/review/
  def review
    @order = Order.find_by_id(params[:order_id])
  end

  # GET /orders/1/delivery/
  def delivery
    @time_slots = TimeSlot.all
    @order = Order.find(params[:order_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).except(:quantities).permit(
        :preferences, :quantities, :timeslot
      )
    end

    def get_quantities
      quantities = []
      params[:order][:quantities].each do |grocery_id, quantity|
        quantities << { grocery_id: grocery_id, quantity: quantity }
      end
      quantities
    end
end
