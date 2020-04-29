Given("I am on the home page") do
  visit root_path
end

When("I click on the shopping button") do
  click_on 'Start Shopping'
end

Then("I should see a list of groceries") do
  expect(page).to have_content("Bread")
end
