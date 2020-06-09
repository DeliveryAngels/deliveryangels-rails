class UseAppropriateColumnTypesForAddresses < ActiveRecord::Migration[6.0]
  def up
    change_column :addresses, :lat, :decimal, precision: 10, scale: 6, using: "lat::numeric(10,6)"
    change_column :addresses, :lng, :decimal, precision: 10, scale: 6, using: "lat::numeric(10,6)"
    add_index :addresses, %i[lat lng]
  end

  def down
    change_column :addresses, :lat, :string
    change_column :addresses, :lng, :string
    remove_index :addresses, %i[lat lng]
  end
end
