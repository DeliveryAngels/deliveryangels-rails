# frozen_string_literal: true

require "rails_helper"


describe "placing an order" do

  fixtures :groceries, :categories, :users, :time_slots

  it "let's a user place an order for groceries" do

    # when I go to the front page
    visit "/"
    expect(page).to have_content("Start Shopping")

    # and I click on start shipping
    click_link "Start Shopping"

    # I should be asked to log-in
    expect(page).to have_content("Account log-in")


    # And I enter that user's credentials
    fill_in 'Email', with: users(:tom).email
    fill_in 'Password', with: 'password'


    # And I go to log in
    click_button 'Log in'

    # and I should be logged in
    expect(page).to have_content("Signed in successfully.")


    # and I should be asked to select an address
    expect(page).to have_content("Select your location")


    fill_in 'First line', with: "10 Downing St"
    fill_in 'Second line', with: "House of cards"
    fill_in 'City', with: "London"
    fill_in 'Postcode', with: "SW1A 2AA"

    click_button "Pick your items"


    # Then I should be on the start shopping page
    expect(page).to have_content("Pick your items")
    expect(page).to have_content("White bread")


    # and I add two White bread and four Spaghetti to my order

    fill_in 'White bread', with: '2'
    fill_in 'Spaghetti', with: '4'
    click_on "Confirm items"

    # then I should see a review my order page, with two white bread
    # and four spaghetti
    expect(page).to have_content("Confirm your items")
    expect(page).to have_content("2 White bread")
    expect(page).to have_content("4 Spaghetti")
    expect(page).to_not have_content("Brown bread")


    # and the page should have an option to let me set brand prefefences
    expect(page).to have_content("Additional notes")
    fill_in "Additional notes", with: "Plant based only"

    # everything looks good and I goto pick a time slot
    click_on "Arrange delivery"

    expect(page).to have_content("Arrange delivery")

    # and I choose the morning
    page.find_by_id(page.find(:label, text: "Morning")["for"]).click
    click_on "Confirm delivery time"

    expect(Order.last.time_slot.name).to eq("Morning")
    expect(page).to have_content("Pending");

    #shows grocery preferences
    expect(page).to have_content("Plant based only")
  end
end

