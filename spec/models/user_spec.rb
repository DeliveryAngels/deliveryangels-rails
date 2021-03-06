# frozen_string_literal: true

require "rails_helper"

describe User do
  describe "#has_address?" do
    fixtures :users, :addresses

    subject { user.has_address? }

    context "when the user has an address" do
      let(:user) { users(:user_with_address) }

      it { is_expected.to be true }
    end

    context "when the user has no address" do
      let(:user) { users(:tom) }

      it { is_expected.to be false }
    end
  end
end
