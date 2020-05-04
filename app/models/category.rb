class Category < ApplicationRecord
  has_many :groceries
  validates :name, uniqueness: true
end
