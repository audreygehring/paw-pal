FactoryGirl.define do
  factory :volunteer_session do
    association :user, factory: :user
    association :shelter, factory: :shelter
    sequence(:date) { |n| n.days.from_now }
    time "10 a.m. - 11 a.m."
  end
end
