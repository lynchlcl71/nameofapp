FactoryGirl.define do
  
  factory :user do
    email "lcl@gmale.com"
    password "pwd1234"
    first_name "LC"
    last_name "Lynch"
    admin false
  end
  
  factory :admin, class: User do
      email "admin@gmale.com"
      password "pwd5678"
      admin true
      first_name "Admin"
      last_name "User"
  end
end