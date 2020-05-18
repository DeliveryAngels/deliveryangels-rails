# frozen_string_literal: true

class OrderItemsController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :set_item, only: [:update]
  before_action :authenticate_user!
  before_action :set_order, only: [:update]

  def update
    if @item.update(item_params)
      redirect_to order_review_path(@order), notice: @item.grocery.name + ' was updated.'
    else
      render :edit
    end
  end

  private
    def set_item
      @item ||= OrderItem.find(params[:id])
    end

    def set_order
      @order ||= set_item.order
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:order_item).permit(:id, :quantity)
    end
end
