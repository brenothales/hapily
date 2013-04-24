FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@example.com"
    password "foobarbaz"
  end
  
  factory :api do
    name "First API"
    description "Describing the first API"
    category "Sample category"
    url "http://www.example.com"
  end
  
  factory :category do
    name "Sample category"
  end
end

