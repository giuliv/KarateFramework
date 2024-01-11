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


    Scenario Outline: verify Post with examples
      Given url '<url>'
      And request {"name":'<name>',"salary":'<salary>',"age":'<age>'}
      When method post
      Then status 200

      Examples:
      |name|salary|age|url|
      |robin|2341 |90|https://dummy.restapiexample.com/api/v1/create|
      |garfield|1349 |40|https://dummy.restapiexample.com/api/v1/create|
      |tony|641 |41|https://dummy.restapiexample.com/api/v1/create|


      #calling another feature file
    Scenario Outline: verify current weather data
      Given url '<url>'
      And request {"name":"test","salary":"123","age":"23"}
      When method post
      Then status 200
      And def otherResponse = call read('classpath:examples/users/GetDataReusability.feature')
      Then print otherResponse.des


      Examples:
        |url|
        |https://dummy.restapiexample.com/api/v1/create|