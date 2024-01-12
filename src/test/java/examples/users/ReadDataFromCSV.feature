Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Scenario: Read data from a CSV file
    Then eval data = read('classpath:examples/text/Book2.csv')
    And print data

  Scenario Outline: verify Post with examples from CSV
    Given url 'https://dummy.restapiexample.com/api/v1/create'
    And request {"name":'<name>',"salary":'<salary>',"age":'<age>'}
    When method post
    Then status 200

    Examples:
    |read('classpath:examples/text/Book3.csv')|
