Feature: Account
User can register for an account and sign up for a profile to use the app.
Registered users can use the app.
Users can delete the account which removes the users profile from the app and archives the users data and notifies the user.

Scenario: User can register for an account
  Given I am a user who wants to register for an account on "Black Dragonfly"
   When I download the app
    And I open the app
   Then I can register for an account on the app

Scenario: User provides data for registration
   When I register for an account on the app
   Then I provide data '<data>'
    And can use samples '<samples>'
|      data      |samples|
|    username    | sloth |
|    password    | hello1|
|confirm password| hello1|
|   first name   | David |
|    last name   |  Lee  |
|       age      |   21  |
|     gender     |  male |
|      state     | oregon|
 
Scenario: Registered users recieve verification email
    When I have register for an account
    Then I recieve a confirmation email

 Scenario: Verify email address after registration
    When I recieve a confirmation email
    Then I verify my email
    And I have a registered account
    
Scenario: User forgets their password
    Given I am registered user with an account
    And I have forgotten my password
    When I request a new password
    Then I can reset my password

Scenario: User resets password
    When I reset my password
    Then I can choose how I recieve a code
    And can recieve the code by:
    |ways to recieve code|
    |email|
    |text|

Scenario: Reset password code is verified
    When I recieve my reset code
    Then I provide the reset code to the reset process
    And the code is verified
    And I can reset my password