# frozen_string_literal: true

When("I visit the homepage") do
  visit "/"
  expect(page).to have_content("Start Shopping")
end

When("I click on {string}") do |string|
  click_on string
end

Then("I should be on the login page") do
  expect(page).to have_content("Account log-in")
end

When("I enter my login credentials") do
  fill_in "Email", with: users(:tom).email
  fill_in "Password", with: "password"
  click_button "Log in"
end

Then("I should be logged in") do
  expect(page).to have_content("Signed in successfully.")
end

Then("I should be asked to select a location") do
  expect(page).to have_content("Select your location")
end

When("I submit my location") do
  fill_in "First line", with: "10 Downing St"
  fill_in "Second line", with: "House of cards"
  fill_in "City", with: "London"
  fill_in "Postcode", with: "SW1A 2AA"
  click_button "Pick your items"
end

Then("I should be asked to pick my groceries") do
  expect(page).to have_content("Pick your items")
  expect(page).to have_content("White bread")
end

When("I add my groceries") do
  fill_in "White bread", with: "2"
  fill_in "Spaghetti", with: "4"
  click_on "Confirm items"
end

Then("I should be asked to confirm my groceries") do
  expect(page).to have_content("Confirm your items")
  expect(page).to have_content("2 White bread")
  expect(page).to have_content("4 Spaghetti")
  expect(page).not_to have_content("Brown bread")
end

When("I confirm my groceries") do
  expect(page).to have_content("Confirm your items")
  expect(page).to have_content("2 White bread")
  expect(page).to have_content("4 Spaghetti")
  expect(page).not_to have_content("Brown bread")
  click_on "Arrange delivery"
end

Then("I should be asked to arrange a delivery slot") do
  expect(page).to have_content("Arrange delivery")
end

When("I choose my delivery slot") do
  page.find_by_id(page.find(:label, text: "Morning")["for"]).click
  click_on "Confirm delivery time"
end

Then("I should see that my order is pending") do
  expect(page).to have_content("Pending")
end

Then("I should see that my timeslot is confirmed") do
  expect(Order.last.time_slot.name).to eq("Morning")
end
