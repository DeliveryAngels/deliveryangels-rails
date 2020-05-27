# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostcodesClient do
  subject(:client) { described_class.new }

  describe "#locate" do
    context "when given a valid postcode" do
      let(:response) do
        {
          "status" => 200,
          "result" => {
            "longitude" => -1.457854,
            "latitude" => 50.934584,
          },
        }
      end

      it "returns the location of that postcode" do
        allow(client).to \
          receive(:postcode_details).with("SO16 9QU")
                                    .and_return(response)

        expect(client.locate("SO16 9QU")).to eq([50.934584, -1.457854])
      end
    end

    context "when given an invalid postcode" do
      let(:error_response) do
        {
          "status" => 404,
          "error" => "Postcode not found",
        }
      end

      it "returns Null Island" do
        allow(client).to \
          receive(:postcode_details)
          .and_return(error_response)

        expect(client.locate("SO16 9ZZ")).to eq([0, 0])
      end
    end
  end
end
