FactoryGirl.define do

    factory :ong do
        email 'ong@ongmail.com'
        password 'password'
        password_confirmation 'password'
        name 'ong name'
        description 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m'
        phone '12345678901'
        cep '01234567'
        address '1234567890'
        uf 'DF'
        city 'Brasilia'
    end

    factory :forum_theme do
        title 'theme title'
        description  'theme description'
    end

    factory :forum_topic do
        title 'topic title'
        body 'topic body'
        author 'author'
        forum_theme
        ong
    end

    factory :forum_post do
        content 'post content'
        forum_topic
    end

    factory :portal_post do
        author 'portal_post author'
        title 'portal_post title'
        body 'portal_post body'
        ong
    end
end
