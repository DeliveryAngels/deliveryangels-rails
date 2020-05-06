# frozen_string_literal: true

require "rails_helper"

describe "an angel who wants to deliver food to people" do
  fixtures :angels

  context "when not logged in" do
    it "sends them to the log in page" do
      visit "/deliveries"
      expect(page).to have_current_path(new_angel_session_path)
    end
  end

  context "when logged in" do
    let!(:user) { angels(:bob) }

    before do
      visit "/angels/sign_in"

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_button("Log in")
    end

    it "welcomes them" do
      expect(page).to have_current_path(deliveries_path)
      expect(page).to have_content("Welcome Angel")
    end
  end

  context "when logged in" do
    let!(:user) { angels(:bob) }

    before do
      visit "/angels/sign_in"

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_button("Log in")
    end

    it "welcomes them" do
      expect(page).to have_current_path("/deliveries")
      expect(page).to have_content("Welcome Angel")
    end
  end
end
