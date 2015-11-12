@basic
Feature: Verify Server Basics
  The server is running and has the correct title page and menu options

  Scenario: The homepage title has the correct information
    Given I am on the homepage
    Then the header should be STORMHOLD
    And the sub-header should be Welcome to the Storm Family Home!

  Scenario: The Navigation menu has the correct options
    Given I am on the homepage
    Then the Nav List should include Control lights
    And the Nav List should include Adjust temperature
    And the Nav List should include View webcams
    And the Nav List should include Listen to local NPR
    And the Nav List should include Check weather 