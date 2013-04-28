FactoryGirl.define do
  factory :user do
    id Random.rand(1..9)
    sequence(:name) {|a| "UserName#{n}"}
    sequence (:email) {|b| "test#{b}@example.com"}
    password "foobarbaz"
  end

  factory :api do
    sequence(:name) {|n| "API#{n}" }
    sequence(:description) {|i| "This API does #{i} and #{i}" }
    sequence(:category) {|j| "Category#{j}" }
    sequence(:url) {|k| "http://www.example#{k}.com" }
  end
  
  factory :category do
    sequence(:name) {|d| "Category#{d}"}
  end
  
  factory :vote do
    api_id 1
    user_id 1
    vote_id 1
  end
end

