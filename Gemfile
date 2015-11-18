ruby ENV['CUSTOM_RUBY_VERSION'] || '2.2.2'

source 'https://rubygems.org'

gem 'rails', '4.2.4'
gem 'mysql2', '~> 0.3.18'
gem 'sass-rails', '~> 5.0.4'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'slim-rails', require: ["slim", "slim/smart"]
gem 'will_paginate', '~> 3.0.6'
gem 'friendly_id'
gem 'redcarpet'
gem 'pygments.rb'
gem 'faker'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
  gem 'pg'
end
