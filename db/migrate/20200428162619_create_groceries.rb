# frozen_string_literal: true

class CreateGroceries < ActiveRecord::Migration[6.0]
  def change
    create_table :groceries do |t|
      t.string :name
      t.timestamps
    end
  end
end