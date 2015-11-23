Feature: manage posts


        In order to access Posts from Forum
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
            Given I am on show_theme page
            When I press "Novo Tópico"
            Then I should be on new_topic page
            When I fill in the following:
                |forum_topic_title     | Topico A     |
                |forum_topic_body      | topic text   |
            And I press "criar tópico"
            Then I should be on show_theme page
            When I follow "Topico A"
            Then I should be on show_topic page

        Scenario: Creating and Editing post
            Given I am on show_topic page
            When I fill in "conteúdo" with "post"
            And I press "criar post"
            Then I should see "post"
            When I follow "editar"
            Then I should be on edit_post page
            When I fill in "conteúdo" with "new post"
            And I press "Update Forum post"
            Then I should be on show_topic page
            And I should see "new post"

        Scenario: Deleting a post
            Given I am on show_topic page
            When I fill in "conteúdo" with "post"
            And I press "criar post"
            Then I should see "post"
            When I follow "apagar"
            Then I should not see "post"


#            Scenario: Reporting a post
#                Given I am on show_topic page
#                When I fill in "conteúdo" with "post"
#                And I press "criar post"
#                Then I should see "post"
#                When I follow "denunciar post"
#                Then it should open a new tab
