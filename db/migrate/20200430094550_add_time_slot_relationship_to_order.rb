class AddTimeSlotRelationshipToOrder < ActiveRecord::Migration[6.0]
  def change
    change_table :orders do |t|
      t.belongs_to :time_slot
    end
  end
end
