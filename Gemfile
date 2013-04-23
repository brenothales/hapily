source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'jquery-rails'
gem 'devise'
gem 'simple_form'
gem "cocaine", "~> 0.5.0"
gem 'will_paginate'
gem 'bootstrap-will_paginate', '0.0.6'
gem 'tweetstream'
gem "letter_opener", :group => :development
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'figaro'
gem "jquery-star-rating-rails"

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'pg'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'shoulda-matchers'
end

group :test do
  gem 'capybara'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass', '~> 2.2.2.0'
end