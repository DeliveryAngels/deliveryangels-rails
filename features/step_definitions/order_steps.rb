# frozen_string_literal: true

When("I visit the homepage") do
  visit "/"
  expect(page).to have_content("Start Shopping")
end

When("I click on {string}") do |string|
  click_on string
end

Then("I should be on the login page") do
  expect(page).to have_content("Log-in to your account")
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

  within(
    first(:label, "White bread").find(:xpath, "ancestor::form"),
  ) do
    expect(find_field("White bread").value).to eq("2")
  end

  expect(page).not_to have_field("Brown bread")
end

When("I confirm my groceries") do
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

Given("I have an order with groceries") do
  sign_in(:user_with_order_with_groceries)
end

When("I visit the order review page") do
  visit order_review_path(@current_user.orders.last)
end

When("I change the quantity of a grocery") do
  @item = @current_user.orders.last.order_items.first
  @grocery = @item.grocery.name
  @current_user.orders.last.order_items.first.quantity
  within("form#" + @item.id.to_s) do
    fill_in @grocery, with: "2"
    click_on "Update quantities"
  end
end

Given(/^I have an order with (\d+) (.*)$/) do |quantity, product|
  sign_in(:user_with_address)

  @order = @current_user.orders.new
  @order.address = @current_user.address
  @grocery = Grocery.find_by_name(product)
  @order.order_items.build(quantity: quantity, grocery: @grocery)
  @order.save
end

When("I press the + button") do
  within("form#" + @order.order_items.first.id.to_s) do
    click_on "+"
  end
end

Then(/I should see (\d+) (.*)$/) do |quantity, product|
  grocery = Grocery.find_by_name(product)

  within("form#" + @order.order_items.first.id.to_s) do
    expect(find_field(grocery.name).value).to eq(quantity.to_s)
  end
end

When("I press the - button") do
  within("form#" + @order.order_items.first.id.to_s) do
    click_on "-"
  end
end

Then(/^I should see that (.*) has been removed from my order$/) do |product|
  expect(page).to have_content product + " was removed."
  expect(@order.reload.order_items).to be_empty
end

Given("I have some orders") do
  sign_in(:user_with_multiple_orders)
end

When("I visit the list of orders page") do
  visit orders_path
end

Then("I should see a list of my orders") do
  expect(page).to have_content(orders(:order_for_user_with_multiple_orders_1).id)
  expect(page).to have_content(orders(:order_for_user_with_multiple_orders_2).id)
  expect(page).to have_content(orders(:order_for_user_with_multiple_orders_3).id)
end

When("I click on the order") do
  click_on "Show"
end

Then("I should information about the order") do
  order = orders(:order_with_groceries)

  expect(page).to have_content(
    "Order " + order.id.to_s,
  )

  expect(page).to have_content(order.preferences)
end

Given("another user has an order") do
  # handled by fixtures
end

Then("I should only see my orders") do
  expect(page).to have_content(orders(:order_for_user_with_multiple_orders_3).id)
  expect(page).not_to have_content(orders(:order_with_groceries).id)
end

Then("I should see the groceries that I ordered") do
  order = users(:user_with_order_with_groceries).orders.first

  order.order_items.each do |item|
    expect(page).to(
      have_content(item.quantity.to_s + " " + item.grocery.name),
    )
  end
end
