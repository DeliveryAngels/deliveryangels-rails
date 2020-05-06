# frozen_string_literal: true

class DeliveriesController < ApplicationController
  before_action :require_angel

  def index; end

  protected

  def require_angel
    redirect_to new_angel_session_path unless current_angel
  end
end
