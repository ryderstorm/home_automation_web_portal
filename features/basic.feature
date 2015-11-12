@basic
Feature: Verify Server Basics
  The server is running and has the correct title page and menu options

  Scenario: The homepage has the correct title
    Given I am on the homepage
    Then the header should be STORMHOLD
    And the sub-header should be Welcome to the Storm Family Home!
