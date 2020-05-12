def sign_in(user)
  user = users(user)
  visit new_user_session_path
  fill_in "user_email", :with => user.email
  fill_in "user_password", :with => "password"
  click_button "Log in"
  expect(page).to have_content("Signed in successfully.")
  @current_user = User.find_by_email(user.email)
end
