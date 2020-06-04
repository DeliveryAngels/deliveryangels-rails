# frozen_string_literal: true

class Address < ApplicationRecord
  include Geolocatable

  belongs_to :user

  before_save :update_location

  acts_as_mappable(
    default_units: :miles,
    default_formula: :sphere,
    distance_field_name: :distance,
    lat_column_name: :lat,
    lng_column_name: :lng,
  )
end
