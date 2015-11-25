Feature: Manage Events


        In order to see and create events
        As any user
        You must access Forum themes, topics and posts


        #Create events

        Scenario: Create an event with valid params
            Given I am on root page
            When I follow "Eventos"
            Then I should be on events page
            When I follow "Novo Evento"
            Then I should be on new_event page
            When I fill in the following:
            |event_title       | Evento               |
            |event_local       | local do evento      |
            |event_description | event description hue|
            When I press "Criar novo evento"
            Then I should be on show_event page

            
