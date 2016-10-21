Feature: First feature file

  Scenario: Printing Hello World!!!
    Given I print in the terminal Hello World

  Scenario: Printing my name
    Given my name is "Lamhot"
    And my last name is "Siagian"

  Scenario: Open Firefox browser
    When I open the "http://google.com" in a browser
    And I search for "Selenium Webdriver" in google search
    Then I click on a search button


