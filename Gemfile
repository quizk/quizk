# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'

#
# Core libraries
#
gem 'rails', '~> 7.0', '>= 7.0.2.4'

#
# Database, ORM, Model, etc
#
gem 'mysql2', '~> 0.5.3'

#
# Web servers
#
gem 'puma', '~> 5.6', '>= 5.6.4'

#
# Views
#
gem 'kaminari', '~> 1.2', '>= 1.2.2'
gem 'ransack', '~> 3.1'
gem 'sass-rails', '~> 6.0'
gem 'simple_form', '~> 5.1'
gem 'slim-rails', '~> 3.4'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.11', '>= 1.11.1', require: false

#
# Authentication and Authorization
#
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'pundit', '~> 2.2'

#
# Serializer
#
gem 'active_model_serializers', '~> 0.10.13'

group :development do
  gem 'annotate', '~> 3.2'
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  gem 'listen', '~> 3.7', '>= 3.7.1'
  gem 'rack-mini-profiler', '~> 3.0'
  gem 'spring', '~> 4.0'
  gem 'web-console', '~> 4.2'
end
