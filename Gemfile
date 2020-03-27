source 'http://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'dry-transaction'
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'grape-swagger-entity'
gem 'json'
gem 'mime-types'
gem 'newrelic_rpm'
gem 'nokogiri'
gem 'rack-cors'
gem 'rake'
gem 'sequel'

group :production do
  gem 'pg'
end
group :development do
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rack'
  gem 'pry'
  gem 'rake'
  gem 'rubocop'
  gem 'sqlite3'
end

group :test do
  gem 'capybara'
  gem 'rack-test'
  gem 'rspec'
  gem 'selenium-webdriver'
end
