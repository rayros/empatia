FactoryGirl.define do
  factory :user do
    email  "test@gmail.com"
    password "password"
    password_confirmation "password"  
  end
end
