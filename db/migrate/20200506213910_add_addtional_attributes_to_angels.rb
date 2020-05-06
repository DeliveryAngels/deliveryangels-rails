# frozen_string_literal: true

class AddAddtionalAttributesToAngels < ActiveRecord::Migration[6.0]
  def change
    add_column :angels, :first_name, :string, null: false
    add_column :angels, :last_name, :string, null: false
    add_column :angels, :phone_number, :string, null: false
    add_column :angels, :postcode, :string, null: false
    add_column :angels, :symptom_free, :boolean, default: false
  end
end
