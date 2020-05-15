# frozen_string_literal: true

class OrderItemsController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :set_item, only: [:update]
  before_action :authenticate_user!

  def update
    if @item.update(item_params)
      redirect_to @example, notice: 'Quantity was successfully updated.'
      render :show, status: :ok, location: @item
    else
      render :edit
    end
  end

  private
    def set_item
      @item = OrderItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      binding.pry
      params.require(:order_item).permit(:id, :quantity)
    end
end
