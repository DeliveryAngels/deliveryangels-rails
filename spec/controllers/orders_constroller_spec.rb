require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "POST #update" do

    # include Devise::Test::IntegrationHelpers
    # include Devise::Test::ControllerHelpers

    context "with a signed-in user" do

      fixtures :users, :addresses, :time_slots, :orders, :groceries, :order_items

      before do
        sign_in users(:user_with_order_with_groceries)
        binding.pry
      end

      context "user changes quantities on an existing order" do
        it "updates the quantities on the user's order" do
          expect(order).items.first.quantitiy.to eq("2")
        end
      end
    end
  end
end


