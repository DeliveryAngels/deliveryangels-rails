# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items
  belongs_to :address
  belongs_to :time_slot, optional: true
  belongs_to :angel, inverse_of: :accepted_orders, optional: true
  belongs_to :user

  acts_as_mappable through: :address

  scope :available, -> { where("angel_id IS NULL") }
  scope :near, ->(origin) { joins(:address).within(5, origin: origin).by_distance(origin: origin) }
end
