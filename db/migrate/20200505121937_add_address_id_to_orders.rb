# frozen_string_literal: true

class AddAddressIdToOrders < ActiveRecord::Migration[6.0]
  def change
    change_table :orders do |t|
      t.belongs_to :address
    end
  end
end
