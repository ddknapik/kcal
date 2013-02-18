# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dish do
    name "MyString"
    ingredient 1
    calorific 1
  end
end
