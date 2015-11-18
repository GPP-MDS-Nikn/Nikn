FactoryGirl.define do
  factory :event do
    title "Title event test"
    local "Brasilia"
    description "In the last chapter we manage to set up the bare bones for our application endpoints configuration, we even added versioning through headers. In (Chapter 5) we will handle users authentication through authentication tokens as well as setting permissions to limit access for let’s say signed in users. In coming chapters we will relate products to users and give them the ability to place orders."
    start_time {DateTime.now + 1.days}
    end_time {DateTime.now + 2.days}
  end
end
