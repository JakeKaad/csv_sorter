# Use Gherkin to Define behavior. No test runner needed


Feature: CSV text sorting
  To be useful for the busines
  CSV files should be sorted
  Strings should be in alphabetical order

  # Happy Path scenario to ensure our sorting logic works
  Scenario: CSV file with all strings
    Given the CSV file has all string values
    And the sorter receives the CSV filepath as an argument
    When we sort the file
    Then there should be an output file sorted alphabetically

  # Boundary test
  Scenario: CSV file with strings and non string values
    Given the CSV file has null values
    And the sorter receives the CSV filepath as an argument
    When we sort the file
    Then there should be an output file sorted alphabetically
    Then there should be an errors file capturing appropriate errors
