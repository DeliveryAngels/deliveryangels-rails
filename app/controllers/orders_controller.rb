# frozen_string_literal: true

class OrdersController < ApplicationController
  include Devise::Controllers::Helpers

  before_action :set_order, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :require_address, only: [:new]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show; end

  # GET /orders/new
  def new
    @categories = Category.all
    @order = current_user.orders.new
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders
  def create # rubocop:disable Metrics/AbcSize
    @order = current_user.orders.new(order_params)
    @order.address = current_user.address

    grocery_id_quantities.each { |id_quantity| @order.order_items.build(**id_quantity) }

    if @order.save
      redirect_to order_review_path(@order)
    else
      @user = current_user
      @groceries = Grocery.all
      render :new
    end
  end

  # GET /orders/1/review
  def pending
    @order = Order.find(params[:order_id])
  end

  # PATCH/PUT /orders/1
  def update # rubocop:disable Metrics/AbcSize
    if stage == "time_slot" && order_params[:time_slot_id].nil?
      @order.errors.add(:base, "Please choose a time slot")
      render :edit
    end

    binding.pry

    if order_params[:order_items].present?
      binding.pry
      @order.build()
    end

    if @order.update(order_params)
      case stage
      when 'review_order'

        redirect_to order_delivery_path(@order)
      when 'time_slot'
        redirect_to order_pending_path(@order)
      else
        redirect_to @order, notice: "Order was successfully updated."
      end
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: "Order was successfully destroyed."
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

  # get order process stage
  def stage
    params[:order][:stage]
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).except(
      :quantities, :stage, :time_slot
    ).permit(
      :preferences, :quantities, :time_slot_id, order_items: {}
    )
  end

  def grocery_id_quantities
    order_quantity_params.each_with_object([]) do |(grocery_id, quantity), order_line|
      quantity = quantity.to_i
      order_line << { grocery_id: grocery_id, quantity: quantity } unless quantity.zero?
    end
  end

  def order_quantity_params
    params.permit(order: { quantities: {} })[:order][:quantities].to_h
  end

  def require_address
    redirect_to new_address_path unless current_user.has_address?
  end
end
