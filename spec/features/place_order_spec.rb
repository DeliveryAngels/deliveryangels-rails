require 'rails_helper'

feature "a vulnerable person places an order for groceries" do
  scenario "everything goes to plan" do

    # Given that some types of Grocery exist

    Grocery.create(name: 'White bread')
    Grocery.create(name: 'Spaghetti')

    # when I go to the front page
    visit "/"
    expect(page).to have_content("Start Shopping")


    # and I click on start shipping
    click_link "Start Shopping"

    # I should be asked to register
    expect(page).to have_content("Account sign-up")

    # And I create an account
    fill_in "First Name", with: "Carrie"
    fill_in "Last Name", with: "Fisher"
    fill_in "Email Address", with: "carrie.fisher@starwars.com"
    fill_in "Phone Number", with: "07845 845845"
    fill_in "Password", with: "hansolo"
    fill_in "Confirm Password", with: "hansolo"
    check "I have read and accept the terms and conditions"
    click_on "Register account"
    user = User.last
    expect(user.first_name).to eq("Carrie")
    expect(user.last_name).to eq("Fisher")
    expect(user.email).to eq("carrie.fisher@starwars.com")
    expect(user.phone).to eq("07845 845845")

    # and I should be on the start shopping page
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

    # everything looks good and I goto pick a time slot
    click_on "Arrange delivery"
    expect(page).to have_content("Arrange delivery")

    # and I choose the morning
    choose '#order_time_slot_1'
    click_on "Confirm delivery time"
    expect(Order.last.time_slot.name).to be("Morning")
    expect(page).to have_content("Pending discussion");
  end
end
