Feature: Placing Orders

  As a Vulnerable Shopper
  I want to signup with my contact details
  So that volunteers know how to contact me

  Scenario: Register an account with contact details
    When I visit the signup page
    And I fill in my contact details
    Then I should have an account with those details

