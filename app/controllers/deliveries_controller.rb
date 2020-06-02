# frozen_string_literal: true

class DeliveriesController < ApplicationController
  before_action :require_angel

  def index
    @location = [50.936870, -1.460181]
    @accepted_orders = current_angel.accepted_orders
    @available_orders = Order.available.near(@location).all
  end

  protected

  def require_angel
    redirect_to new_angel_session_path unless angel_signed_in?
  end
end
