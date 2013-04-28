# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    results "Success"
    customer_id "abc123"
  end
end
