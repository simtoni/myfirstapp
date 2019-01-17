FactoryBot.define do
  sequence(:email) { |n| "user#{n}@mail.com" }

  factory :user do
    email
    password "testpassword123"
    first_name "Example"
    last_name "Name"
    admin false
  end

  factory :admin, class: User do
    email
    password "qwertyuiop"
    admin true
    first_name "Admin"
    last_name "User"
  end
end
