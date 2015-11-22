Feature: Access Forum Themes

        In order to access Themes from Forum
        As any user
        You must access Forum themes

    #Themes
        Scenario: Creating and Editing theme with valid params
            Given I am on forum_themes page
            When I press "criar tema"
            Then I should be on new_theme page
            When I fill in the following:
                |Tema:     | Tema A       |
                |Descrição:| primeiro tema|
            When I press "criar tema"
            Then I should be on forum_themes page
            When I follow "editar"
            Then I should be on edit_theme page
            When I fill in the following:
                |Tema:     | Novo título   |
                |Descrição:| Nova descrição|
            When I press "criar tema"
            Then I should be on show_theme page


        Scenario: Creating theme with invalid params
            Given I am on forum_themes page
            When I press "criar tema"
            Then I should be on new_theme page
            When I fill in the following:
                |Tema:     | A            |
                |Descrição:|              |
            When I press "criar tema"
            Then I should be on new_theme page
