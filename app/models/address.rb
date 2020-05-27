# frozen_string_literal: true

class Address < ApplicationRecord
  class NullLocater
    def locate(_postcode)
      [0, 0]
    end
  end

  # An object that responds to locate(postcode) and returns [lat, lng]
  # pair. Defaults to PostcodesClient if not explicitly set.
  attr_writer :geolocater

  delegate :locate, to: :geolocater
  before_save :update_location

  belongs_to :user

  def geolocater
    @geolocater ||= Rails.env.test? ? NullLocater.new : PostcodesClient.new
  end

  def update_location
    return true unless lat.nil?

    location = geolocater.locate(postcode)
    self.lat = location[0]
    self.lng = location[1]
  end
end
