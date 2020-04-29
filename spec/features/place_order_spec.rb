require 'rails_helper'

feature "a vulnerable person places an order for groceries" do
  scenario "everything goed to plan" do 

    # when I go to the front page
    visit "/"
    expect(page).to have_content("Start Shopping")

  end
end