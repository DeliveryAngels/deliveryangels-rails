require 'rails_helper'

feature "a vulnerable person places an order for groceries" do
  scenario "everything goes to plan" do 

    # Given that some types of Grocery exist

    Grocery.create(name: 'White bread')
    Grocery.create(name: 'Spaghetti')
    
    # when I go to the front page
    visit "/"
    expect(page).to have_content("Start Shopping")


    # and I visit the start shopping page
    click_link "Start Shopping"
    expect(page).to have_content("Pick your items")
    expect(page).to have_content("White bread")


    # and I add two White bread and four Spaghetti to my order

      # fill_in ?


      # submit form

      expect(page).to have_content("Arrange delivery")

    # And I want to have my order delivered in the morning


  end
end