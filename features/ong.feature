Feature: Manage Ongs

Before do |Ong|
  Ong.create{:email => "example@teste.com.br",
  :password => "1234567h",:password_confirmation => "1234567h"}
  end

        In order to manage Ongs
        As an unlogged Ongs
        You must create, log_in or edit Ongs

#Create ongs

        #Testing if entrar redirects to sign_in page
        Scenario: Access sign_in page
        Given I am on root page
        When I follow "Entrar"
        Then I should be on sign_in page

        #Testing if it creates a new ong and then after goes to root
        Scenario: Create new ong with valid params
        Given I am on root page
        When I follow "Entrar"
        Then I should be on sign_in page
        When I follow "Sign up"
        Then I should be on sign_up page
        When I fill in the following:
            |Email                  | email@email.com|
            |Password               | 12345678       |
            |Password confirmation  | 12345678       |
        When I press "Sign up"
        Then I should be on root page

        #Testing if it stays on ong page if creating new ong with invalid params
        Scenario: Create new ong with invalid params
        Given I am on root page
        When I follow "Entrar"
        Then I should be on sign_in page
        When I follow "Sign up"
        Then I should be on sign_up page
        When I fill in the following:
            |Email                  | emailemail.com |
            |Password               | 123456         |
            |Password confirmation  | 12345678       |
        When I press "Sign up"
        Then I should be on ong page

        #Accessing sign_in page from sign_up page
        Scenario: Go to sign_in page from sign_up page
        Given I am on root page
        When I follow "Entrar"
        Then I should be on sign_in page
        When I follow "Sign up"
        Then I should be on sign_up page
        When I follow "Log in"
        Then I should be on sign_in page

#Sign in ongs

        #Testing if ong sign in with valid params
        Scenario: Login with valid params
        Given I am on root page
        When I follow "Entrar"
        Then I should be on sign_in page
        When I fill in the following:
            |Email                  | email@teste.com|
            |Password               | 1234567h       |
        When I press "Log in"
        Then I should be on sign_in page

        #Testing if ong can't sign in with inalid params
        Scenario: Login with invalid params
        Given I am on root page
        When I follow "Entrar"
        Then I should be on sign_in page
        When I fill in the following:
            |Email                  | emailteste.com|
            |Password               | 123h          |
        When I press "Log in"
        Then I should be on sign_in page

        #Testing with ong can't sign in with non existent params
        Scenario: Login with non existent params
        Given I am on root page
        When I follow "Entrar"
        Then I should be on sign_in page
        When I fill in the following:
            |Email                  | nonex@teste.com|
            |Password               | 1234567h       |
        When I press "Log in"
        Then I should be on sign_in page
