Feature: Read the data from a java class


  Scenario: Verify reading the data from a java class
    Then def reusable = Java.type('examples.Reader')
    Then def sumValue = reusable.sum(5,5)
    Then def msgValue = reusable.loginMessage()
    And print sumValue
    And print msgValue

