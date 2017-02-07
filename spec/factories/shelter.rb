FactoryGirl.define do
  factory :shelter do
    sequence(:name) { |n| "Direwolf Shelter #{n}" }
    sequence(:address) { |n| "123 Winterfell Way #{n}" }
    sequence(:city) { |n| "Winterfell #{n}" }
    sequence(:state) { |n| "The North #{n}" }
    sequence(:zip) { |n| "0000#{n}" }
  end
end
