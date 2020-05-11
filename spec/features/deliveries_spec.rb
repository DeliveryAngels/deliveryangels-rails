# frozen_string_literal: true

require "rails_helper"

describe "an angel who wants to deliver food to people" do
  fixtures :angels, :users

  context "when not logged in" do
    it "sends them to the log in page" do
      visit "/deliveries"
      expect(page).to have_current_path(new_angel_session_path)
    end
  end

  context "when logged in" do
    let!(:angel) { angels(:bob) }
    let!(:user) { users(:user_with_address) }

    before do
      user.orders.create!(angel: angel, address: user.address)

      visit "/angels/sign_in"

      fill_in "Email", with: angel.email
      fill_in "Password", with: "password"
      click_button("Log in")
    end

    it "includes a list of orders that have been accepted" do
      expect(page).to have_content("Request 1")
      expect(page).to have_content("Delivery for #{user.first_name}")
    end

    it "includes orders that need someone to deliver them"
  end
end
