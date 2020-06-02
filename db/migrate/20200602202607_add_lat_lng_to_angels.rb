class AddLatLngToAngels < ActiveRecord::Migration[6.0]
  def change
    add_column :angels, :lat, :decimal, precision: 10, scale: 6
    add_column :angels, :lng, :decimal, precision: 10, scale: 6
    add_index :angels, %i[lat lng]
  end
end
