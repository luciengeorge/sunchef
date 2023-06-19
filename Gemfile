# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"

gem "administrate"
gem "administrate-field-active_storage"
gem "administrate-field-enum"
gem "administrate-field-nested_has_many"
gem "aws-sdk-s3", "~> 1"
gem "bootsnap", require: false
gem "bootstrap", "~> 5.2.2"
gem "browser"
gem "devise"
gem "image_processing"
gem "importmap-rails"
gem "jbuilder"
gem "jquery-rails"
gem "pg", "~> 1.1"
gem "postmark-rails"
gem "puma", "~> 5.0"
gem "pundit"
gem "rack-canonical-host"
gem "redis", "~> 4.0"
gem "sass-rails"
gem "simple_form"
gem "sorbet-static-and-runtime"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "view_component"

group :development, :test do
  gem "debug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "faker"
  gem "letter_opener"
  gem "rack-mini-profiler"
  gem "rubocop"
  gem "rubocop-shopify"
  gem "tapioca", require: false
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
