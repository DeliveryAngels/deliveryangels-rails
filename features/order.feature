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

  Scenario: Change the quantities of stuff in my shopping list
    Given I have an order with groceries
    When I visit the order review page
    And I change the quantity of a grocery
    Then I should see that quantity has changed
    And I should be told that my order has been updated
