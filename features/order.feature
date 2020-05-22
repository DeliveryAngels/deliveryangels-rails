Feature: Placing Orders

  As a Vulnerable Shopper
  I want to place orders for Groceries
  So that my basic needs can be met

  Scenario: Happy Path where nothing goes wrong from Rspec
    When I visit the homepage
    And I click on "Start Shopping"
    Then I should be on the login page
    When I enter my login credentials
    Then I should be logged in
    And I should be asked to select a location
    When I submit my location
    Then I should be asked to pick my groceries
    When I add my groceries
    Then I should be asked to confirm my groceries
    When I confirm my groceries
    Then I should be asked to arrange a delivery slot
    When I choose my delivery slot
    Then I should see that my order is pending
    And I should see that my timeslot is confirmed

  Scenario: Increase the quantitiy by 1
    Given I have an order with 1 White bread
    When I visit the order review page
    And I press the + button
    Then I should see 2 White bread

  Scenario: Decrease the quantitiy by 1
    Given I have an order with 2 White bread
    When I visit the order review page
    And I press the - button
    Then I should see 1 White bread

  Scenario: Decrease the quantitiy to 0
    Given I have an order with 1 White bread
    When I visit the order review page
    And I press the - button
    Then I should see that White bread has been removed from my order

  Scenario: List of orders
    Given I have some orders
    When I visit the list of orders page
    Then I should see a list of my orders
    And I should only see my orders

  Scenario: View order
    Given I have an order with groceries
    When I visit the list of orders page
    And I click on the order
    Then I should information about the order
