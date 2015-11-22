Feature: Access Forum Topics

        In order to access Topics from Forum
        As any user
        You must access Forum themes, then topics

        Background:
            Given I am on forum_themes page
            When I press "criar tema"
            Then I should be on new_theme page
            When I fill in the following:
                |Tema:     | Tema A       |
                |Descrição:| primeiro tema|
            When I press "criar tema"
            Then I should be on forum_themes page

            #Topics
        Scenario: Creating and Editing topic with valid params
            Given I am on show_theme page
            When I press "Novo Tópico"
            Then I should be on new_topic page
            When I fill in the following:
                |forum_topic_title     | Topic Title  |
                |forum_topic_body      | topic text   |
            And I press "criar tópico"
            Then I should be on show_theme page
            When I follow "editar"
            Then I should be on edit_topic page
            When I fill in the following:
                |forum_topic_title     | new Title  |
                |forum_topic_body      | new text   |
            When I press "Update Forum topic"
            Then I should be on show_topic page

        Scenario: Creating topic with invalid params
            Given I am on show_theme page
            When I press "Novo Tópico"
            Then I should be on new_topic page
            When I fill in the following:
                |forum_topic_title     | T  |
                |forum_topic_body      |    |
            And I press "criar tópico"
            Then I should be on new_topic page
