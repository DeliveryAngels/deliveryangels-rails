When(/^I visit the signup page$/) do
  visit new_user_registration_path
end

When("I fill in my contact details") do
  @new_user = {
    first_name: "Jane",
    last_name: "Doe",
    phone_number: "00000 000000",
  }

  fill_in("First name", with: @new_user[:first_name])
  fill_in("Last name", with: @new_user[:last_name])
  fill_in("Email", with: "valid@email.is")
  fill_in("Phone number", with: @new_user[:phone_number])
  fill_in("Password", with: "123456")
  fill_in("Confirm password", with: "123456")
  click_on("Register account")
end

Then("I should have an account with those details") do
  expect(User.last.first_name).to eq(@new_user[:first_name])
  expect(User.last.last_name).to eq(@new_user[:last_name])
  expect(User.last.phone_number).to eq(@new_user[:phone_number])
  expect(page).to have_content("You have signed up successfully.")
end
