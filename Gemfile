source 'https://rubygems.org'

# Infrastructure
gem 'rails', '4.0.0'
gem 'pg'
gem 'thin'

# Visual
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'haml'
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                              :github => 'anjlab/bootstrap-rails',
                              :branch => '3.0.0'
gem 'compass-rails', github: 'milgner/compass-rails', ref: '1749c06f15dc4b058427e7969810457213647fb8'
gem 'font-awesome-rails'

# Services
gem 'httparty'
gem 'nokogiri'
gem 'omniauth'
gem 'omniauth-github'
gem 'octokit'


# Utilities
gem 'controller_support'
gem 'configreader'
gem 'will_paginate', '~> 3.0'
gem 'enumify', '~> 0.0.4'

group :development do
  gem 'powder'
  gem 'awesome_print'
  gem 'quiet_assets'
end

group :development, :test do
  gem 'debugger'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'spork-rails', :github => 'sporkrb/spork-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'growl'
end


group :production do
  gem 'rails_12factor'
end

group :doc do
  gem 'sdoc', require: false
end