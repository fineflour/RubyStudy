source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '2.2.2'
gem 'rails', '4.2.1'
# Use sqlite3 as the database for Active Record
gem 'pg'
gem 'pg_search'
gem 'pundit'


gem 'lol_dba'

gem 'delayed_job_active_record'
gem 'delayed_job_web'


gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring

#Bootstrap

  gem 'bootstrap-sass', '~> 3.1.1.0'
  gem 'twitter-bootstrap-rails'
  gem 'bootstrap_form'
  gem 'simple_form'

  gem 'haml-rails'


  group :assets do
    gem 'sass-rails' 
    gem 'uglifier'
    gem 'coffee-rails'
  end

  gem 'jquery-rails'
  gem 'turbolinks'
  gem 'jbuilder'
  gem 'sdoc', '~> 0.4.0',  group: :doc
  gem 'will_paginate'
  gem 'will_paginate-bootstrap'

  gem 'rest-client'

  gem 'nested_form'
  gem 'has_scope'

  gem 'statesman'

  gem 'figaro'

  gem 'browser-timezone-rails'

  gem 'paper_trail'
  gem 'devise', '3.4.1'
  gem 'keyword_search'

  
 group :production, :staging do
  gem 'unicorn'
  gem 'unicorn-worker-killer'
  gem 'skylight' # rails operations tool / manager
  gem 'rack-timeout'
end

group :development, :test, :staging do
  gem 'fakeweb'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'faker'
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-nav'
  gem 'seed_dump'
  gem 'hirb'
  gem 'awesome_print'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'letter_opener'
  gem 'letter_opener_web', '~> 1.2.0'
  gem 'rubocop'
  gem 'quiet_assets'
end

group :test do
  gem 'timecop'
  gem 'capybara'
  gem 'capybara-webkit' #for testing javascript / ajax
  gem 'launchy'
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
  gem 'shoulda-callback-matchers', '~> 1.1.1'
  gem 'rspec-collection_matchers'
  gem 'seedbank'
  gem 'rake'
  gem 'simplecov', :require => false # test coverage
  gem 'webmock' # Library for stubbing and setting expectations on HTTP request in Ruby
  gem 'sinatra'
  gem 'cancan'
end
