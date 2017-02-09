FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "Arya #{n}" }
    sequence(:last_name) { |n| "Stark #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
    favorite_animal "Dog"
    admin false
    role nil
    association :shelter, factory: :shelter
  end
end
