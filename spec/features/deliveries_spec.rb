# frozen_string_literal: true

require "rails_helper"

describe "an angel who wants to deliver food to people", type: :feature do
  fixtures :angels, :users, :addresses, :time_slots

  context "when not logged in" do
    it "sends them to the log in page" do
      visit "/deliveries"
      expect(page).to have_current_path(new_angel_session_path)
    end
  end

  context "when logged in" do
    let!(:angel) { angels(:bob) }
    let!(:user) { users(:user_with_address) }
    let!(:time_slot) { time_slots(:am) }
    let!(:unassigned_order) do
      user.orders.create!(address: user.address, time_slot: time_slot)
    end

    before do
      user.orders.create!(
        angel: angel,
        address: user.address,
        time_slot: time_slot,
      )

      visit "/angels/sign_in"

      fill_in "Email", with: angel.email
      fill_in "Password", with: "password"
      click_button("Log in")
    end

    it "includes a list of orders that have been accepted" do
      page.within("#accepted_deliveries") do
        expect(page).to have_content("Delivery for #{user.first_name}")
      end
    end

    it "includes orders that need someone to deliver them" do
      page.within("#available_deliveries") do
        expect(page).to have_content("Request 1")
        expect(page).to have_content("Delivery for #{unassigned_order.user.first_name}")
      end
    end
  end
end
