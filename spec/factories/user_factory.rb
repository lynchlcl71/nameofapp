FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email 
    password "pwd1234"
    first_name "LC"
    last_name "Lynch"
    admin false
  end
  
  factory :admin, class: User do
    email 
    password "pwd5678"
    first_name "Admin"
    last_name "User"
    admin true
  end
end