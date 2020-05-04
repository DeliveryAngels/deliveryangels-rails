class TimeSlot < ApplicationRecord
  validates :code, uniqueness: true
  validates :name, uniqueness: true
end
