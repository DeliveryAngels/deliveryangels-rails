class RemoveTimeslotFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :timeslot
  end
end
