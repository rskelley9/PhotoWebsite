# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service_request do
    email "MyString"
    name "MyString"
    message "MyText"
    read false
    address "MyString"
    state "MyString"
    phone "MyString"
    day false
  end
end
