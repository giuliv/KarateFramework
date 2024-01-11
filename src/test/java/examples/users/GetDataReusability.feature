Feature: Reusable function

  @getExample3
  Scenario: Verify current weather data reusability
    Given url 'https://api.openweathermap.org/data/2.5/weather?q=London&appid=00a01bcdf4193f4d3bdfb0a69c61e9d7'
    When method get
    Then status 200
    And def des = response.weather[0].description
    And print des