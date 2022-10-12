# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'cssbundling-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.3'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
# gem "redis", "~> 4.0"
# gem "kredis"
# gem "bcrypt", "~> 3.1.7"
gem 'bootsnap', require: false
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# gem "sassc-rails"
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  # Security tools
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'ruby_audit'
  # Linting
  gem 'rubocop'
  gem 'rubocop-rails'
end

group :development do
  gem 'web-console'
  # gem "rack-mini-profiler"
  # gem "spring"
  gem "wkhtmltopdf-binary"
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'country_select', '~> 6.0'
gem 'devise'
gem 'pagy', '~> 5.10'
gem 'wicked_pdf'
