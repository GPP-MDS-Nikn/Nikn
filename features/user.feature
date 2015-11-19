Feature: Manage Users
        In order to manage Users
        As an unlogged User
        You must create, login or edit User

        Scenario: Access login page
        Given I am on root page
        When I follow "Entrar"
        Then I should be on login page
