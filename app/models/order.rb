# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items
  belongs_to :address
  belongs_to :time_slot, optional: true

  belongs_to :angel, inverse_of: :accepted_orders, optional: true
  belongs_to :user

  scope :available, -> { where("angel_id IS NULL") }
end
