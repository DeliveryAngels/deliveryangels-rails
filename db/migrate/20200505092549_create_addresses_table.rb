# frozen_string_literal: true

class CreateAddressesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :first_line
      t.string :second_line
      t.string :city
      t.string :postcode
      t.belongs_to :user
    end
  end
end
