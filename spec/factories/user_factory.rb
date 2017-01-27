FactoryGirl.define do
  
  factory :user do
    email "lcl@gmale.com"
    password "pwd1"
    first_name "LC"
    last_name "Lynch"
    admin false
  end
  
  factory :admin, class: User do
      email "admin@gmale.com"
      password "pwd2"
      admin true
      first_name "Admin"
      last_name "User"
  end
end