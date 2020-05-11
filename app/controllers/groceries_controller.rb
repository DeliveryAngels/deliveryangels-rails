# frozen_string_literal: true

class GroceriesController < ApplicationController
  def index
    @groceries = Grocery.all
  end
end
