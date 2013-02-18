FactoryGirl.define do
  factory :dish do
    sequence(:name){ |n| "pizza#{n}"}
    ingredient 1
    calorific 1
  end
end
