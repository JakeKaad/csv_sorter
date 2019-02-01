# Use Gherkin to Define behavior. No test runner needed


Feature: CSV text sorting
  To be useful for the busines
  CSV files should be sorted
  Strings should be in alphabetical order

  # Happy Path scenario to ensure our sorting logic works.
  #
  # Gotta make sure it works when we refactor our code!
  Scenario: CSV file with all strings
    Given the CSV file has all string values
    And the sorter receives the CSV filepath as an argument
    When we sort the file
    Then there should be an output file sorted alphabetically

  # Boundary test. Ruby CSV parses values to a string or nil, so we
  # don't need to do any checks for non string values besides nil.
  # Typically Boundary testing in Ruby is very important, since Ruby is
  # not strictly typed. This test will ensure that CSVs with nil values
  # will never break our sorting feature.
  Scenario: CSV file with strings and non string values
    Given the CSV file has null values
    And the sorter receives the CSV filepath as an argument
    When we sort the file
    Then there should be an output file sorted alphabetically

  # Validation testing
  # We are raising exceptions with invalid data, these tests will ensure that
  # our validations trigger correctly. We also should add tests at some point
  # to ensure we are handling these errors appropriately in the application.
  #
  # I am choosing not to write the exception handling test at this point
  # because I am not integrating this sorting feature with any other application
  # interface at this point, and just running it from bash.
  Scenario: An empty CSV file is invalid
    Given a CSV file with no content
    And the sorter receives the CSV filepath as an argument
    Then the CSV sorter is invalid

  Scenario: A CSV file with more than one line is invalid
    Given a CSV file with more than one line
    And the sorter receives the CSV filepath as an argument
    Then the CSV sorter is invalid

  Scenario: An empty filename is invalid
    Given a CSV filepath that is nil
    And the sorter receives the CSV filepath as an argument
    Then the CSV sorter is invalid

  Scenario: An filename that is not csv
    Given a filepath leading to a non csv file
    And the sorter receives the CSV filepath as an argument
    Then the CSV sorter is invalid
