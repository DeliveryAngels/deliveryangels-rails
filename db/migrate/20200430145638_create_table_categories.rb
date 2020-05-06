# frozen_string_literal: true

class CreateTableCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
    end

    change_table :groceries do |t|
      t.belongs_to :category
    end
  end
end
