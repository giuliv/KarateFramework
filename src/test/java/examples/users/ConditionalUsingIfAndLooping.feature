Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Scenario: Verify info from the response using If and Loop
    Given url 'https://gorest.co.in/public/v1/users'
    When method get
    Then status 200
    When def outputEmail = []
    When def outputGender = []
    And eval for(var i=0;i<response.data.length;i++) if(response.data[i].name.endsWith("Arora")) outputEmail.push(response.data[i].email), outputGender.push(response.data[i].gender)
    And print outputEmail
    And print outputGender
