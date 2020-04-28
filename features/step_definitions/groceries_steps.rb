Given("I am on the home page") do
  visit root_path
end

When("I click on the shopping button") do
  click_on 'Start Shopping'
end

Then("I should see a list of groceries") do
  pending # Write code here that turns the phrase above into concrete actions
end
