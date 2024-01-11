Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'https://api.openweathermap.org/data/2.5/weather?q=London&appid=00a01bcdf4193f4d3bdfb0a69c61e9d7'

  Scenario: verify current whether data
    When method get
    Then status 200
    And print response
    And match response.weather[0].description !contains 'surendra Jaganadam'
    And match response.weather[0].description == '#string'


  Scenario Outline: verify current weather data
    Given url '<url>'
    When method get
    Then status 200

    Examples:
    |url|
    |https://api.openweathermap.org/data/2.5/weather?q=London&appid=00a01bcdf4193f4d3bdfb0a69c61e9d7|

  Scenario Outline: Validation using match each
    Given url '<url>'
    When method get
    Then status 200
    And print response
    Then match each response.data ==
    """
    {
      "id": "#number",
      "employee_name": "#string",
      "employee_salary": "#number",
      "employee_age": "#number",
      "profile_image": "##string"
    }
    """

    Examples:
      |url|
      |https://dummy.restapiexample.com/api/v1/employees|