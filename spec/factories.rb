FactoryGirl.define do
  factory :forum_theme do
    title "theme title"
    description  "theme description"
  end

 factory :forum_topic do
    title "topic title"
    body "topic body"
    forum_theme
  end
end
