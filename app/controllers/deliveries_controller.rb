# frozen_string_literal: true

class DeliveriesController < ApplicationController
  before_action :require_angel

  def index
    @accepted_orders = current_angel.accepted_orders
    @available_orders = Order.available.all
  end

  protected

  def require_angel
    redirect_to new_angel_session_path unless angel_signed_in?
  end
end
