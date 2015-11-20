Feature: Access Forum



        In order to access Forum
        As any user
        You must access Forum themes, topics and posts

    #Themes
        Scenario: Creating theme with valid params
        Given I am on forum_themes page
        When I press "criar tema"
        Then I should be on new_theme page
        When I fill in the following:
            |Tema:     | Tema A       |
            |Descrição:| primeiro tema|
        When I press "criar tema"
        Then I should be on forum_themes page


        Scenario: Creating theme with invalid params
        Given I am on forum_themes page
        When I press "criar tema"
        Then I should be on new_theme page
        When I fill in the following:
            |Tema:     | A            |
            |Descrição:|              |
        When I press "criar tema"
        Then I should be on new_theme page

        Scenario: Editing exsting theme
        Given I am on forum_themes page
        #creating valid theme begin
        When I press "criar tema"
        Then I should be on new_theme page
        When I fill in the following:
            |Tema:     | Tema A       |
            |Descrição:| primeiro tema|
        When I press "criar tema"
        Then I should be on forum_themes page
        #end
        When I follow "editar"
        Then I should be on edit_theme page
        When I fill in the following:
            |Tema:     | Novo título   |
            |Descrição:| Nova descrição|
        When I press "criar tema"
        Then I should be on show_theme page

        #This test cant be done, for cucumber does not work with dialogue boxes...
        #Scenario: Deleting existing theme

        Scenario: Accessing existing theme
        Given I am on forum_themes page
        #creating valid theme begin
        When I press "criar tema"
        Then I should be on new_theme page
        When I fill in the following:
            |Tema:     | Tema A       |
            |Descrição:| primeiro tema|
        When I press "criar tema"
        Then I should be on forum_themes page
        #end
        When I follow "Tema A"
        Then I should be on show_theme page

        #Topics
        Scenario: Creating topic with valid params
        Scenario: Creating topic with invalid params
        Scenario: Editing exsting topic
        Scenario: Deleting existing topic
        Scenario: Accessing existing topic
        Scenario: Reporting topic

        #Posts
        Scenario: Creating post with valid params
        Scenario: Creating post with invalid params
        Scenario: Reporting post
