# frozen_string_literal: true

class OrderItemsController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :set_item, only: [:update]
  before_action :authenticate_user!
  before_action :set_order, only: [:update]

  def update
    quantity = item_params[:quantity].to_i

    case params[:commit]
    when '+' then quantity+= 1
    when '-' then quantity-= 1
    end

    case quantity
    when 0 then destroy(@item)
    when 1..4 then update_item(@item, quantity)
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

    def destroy(item)
      item.destroy!
      redirect_to(
        order_review_path(@order),
        notice: @item.grocery.name + ' was removed.'
      )
    end

    def update_item(item, quantity)
      redirect_to(
        order_review_path(@order),
        notice: item.grocery.name + ' was updated.'
      ) if item.update({ quantity: quantity })
    end
end
