FactoryBot.define do
  sequence(:name) { |n| "productname#{n}" }

  factory :product do
    name
    description "this is a dicription"
    price 50
    image_url "img.jpg"
  end
end
