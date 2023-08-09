#tags can be added on top of a feature file too to include all scenarios
@REGRESSION
Feature: Login feature
    As a user, I should be able to login.


  @login
  @DM-23 @smoke
  Scenario: Login with valid credentials
    When I enter the valid credentials
    Then I should be able to login

  @login @invalid @smoke
  Scenario: Login with invalid credentials
    When I enter the invalid credentials
    Then I should not be able to login

  @smoke
  Scenario: User enters invalid credentials
    When I enter invalid username or password
    And click on the login button
    Then I should see an error message


   @testing_GA @smoke
  Scenario: Login with valid credentials parameters
    When I enter username as "duotech2023" and password as "duotech"
    Then I should be able to login


  Scenario: Login with invalid credentials parameters
    When I enter username as "duotech2024" and password as "duotech2024"
    Then I should not be able to login

    @login
  Scenario Outline: Login with invalid credentials parameters
    When I enter username as "<username>" and password as "<password>"
    Then I should not be able to login
 Examples:
   | username     | password   |
   | duotech2024  | duotech    |
   | duotech2003  | dt123432   |
   | duotech324   | dt1344332  |
   | duotech3243  | dt14352    |
   | duotech32423 | dt12543542 |



#
#  Scenario: User forgot password and resets it
#    Given the user is on the login page
#    When the user clicks on the “Forgot password” link
#    And enters their email address
#    And clicks on the “Reset password” button
#    Then the user should receive an email with instructions to reset their password
#
#  Scenario: User tries to access protected page without logging in
#    Given the user is not logged in
#    When the user tries to access a protected page
#    Then the user should be redirected to the login page
#
#  Scenario: User logs out of the application
#    Given the user is logged in
#    When the user clicks on the “Logout” button
#    Then the user should be redirected to the login page