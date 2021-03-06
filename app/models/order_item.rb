# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :grocery
  belongs_to :order

  def name
    grocery.name
  end
end
