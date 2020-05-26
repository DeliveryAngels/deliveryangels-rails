# frozen_string_literal: true

class AssociateOrdersWithAngels < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :angel, foreign_key: true, null: true
  end
end
