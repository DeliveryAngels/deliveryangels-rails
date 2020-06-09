# frozen_string_literal: true

require "rails_helper"

RSpec.describe Address do
  describe "#update_location" do
    let(:location) { [50.934697, -1.457423] }
    let(:geolocater) { instance_double("PostcodesClient", locate: location) }
    let(:address) do
      described_class.new(postcode: "SO16 9QU").tap do |a|
        a.geolocater = geolocater
      end
    end

    it "updates latitude and longitude based on geolocation" do
      address.update_location
      expect([address.lat, address.lng]).to eq(location)
    end

    it "does not override an existing location" do
      address.lat = 0
      address.lng = 0
      address.update_location

      expect([address.lat, address.lng]).to eq([0, 0])
    end
  end
end
