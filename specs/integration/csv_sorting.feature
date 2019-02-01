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

  # Boundary test. Ruby CSV parses values to a string or nil, so we
  # don't need to do any checks for non string values besides nil
  Scenario: CSV file with strings and non string values
    Given the CSV file has null values
    And the sorter receives the CSV filepath as an argument
    When we sort the file
    Then there should be an output file sorted alphabetically
    Then there should be an errors file capturing appropriate errors

  # Validation testing
  Scenario: An empty CSV file is invalid
    Given a CSV file with no content
    And the sorter receives the CSV filepath as an argument
    Then the CSV sorter is invalid

  Scenario: A CSV file with more than one line is invalid
    Given a CSV file with more than one line
    And the sorter receives the CSV filepath as an argument
    Then the CSV sorter is invalid
