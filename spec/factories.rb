FactoryGirl.define do
    factory :forum_theme do
        title "theme title"
        description  "theme description"
    end

    factory :forum_topic do
        title "topic title"
        body "topic body"
        author "author"
        forum_theme
    end

    factory :forum_post do
        content "post content"
        forum_topic
    end
end
