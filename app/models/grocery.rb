# frozen_string_literal: true

class Grocery < ApplicationRecord
  belongs_to :category
  validates :name, uniqueness: true
end
