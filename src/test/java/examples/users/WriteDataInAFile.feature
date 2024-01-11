Feature: Read the data from a java class


  Scenario: Verify the placement of data from a response
  Given url 'https://gorest.co.in/public/v1/users'
    When method get
    Then status 200
    When def outputEmail = []
    When def outputGender = []
    And eval for(var i=0;i<response.data.length;i++) if(response.data[i].name.endsWith("Chopra")) outputEmail.push(response.data[i].email), outputGender.push(response.data[i].gender)
    And print outputEmail
    And print outputGender
    And karate.write(outputEmail,"Maildetails.txt");
    #And karate.write(outputGender,"Maildetails.txt");