@basic
Feature: Verify Server Basics
  The server is running and has the correct title page and menu options
  
  Scenario: The homepage has the correct title
    Given I am on the homepage
    Then the title should include Stormhold
    And the sub-title should include Welcome to the Storm Family Home
    