class Order < ApplicationRecord
  has_many :order_items
  belongs_to :time_slot, optional: true
end
