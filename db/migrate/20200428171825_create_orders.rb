class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.text :preferences
      t.string :timeslot
      t.timestamps
    end

    create_table :order_items do |t|
      t.belongs_to :order
      t.references :grocery
      t.integer :quantity
      t.timestamps
    end
  end
end
