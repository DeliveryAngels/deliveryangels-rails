class AddLocationToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :lng, :string
    add_column :addresses, :lat, :string
  end
end
