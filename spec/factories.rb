FactoryGirl.define do

  factory :member, class: User do
    username "memberuser"
    email "member@symposium.com" 
    password "secret"
  end
  factory :admin, class: User do
    username "adminuser"
    email "admin@symposium.com" 
    password "secret"
  end

  factory :forum, class: Forum do
    name "testforum"
    description "testdescription"
  end

end
