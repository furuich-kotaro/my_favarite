source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.0'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'bootstrap', '~> 4.3.1'
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'sassc-rails', '>= 2.1.0'
gem 'slim-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'acts-as-taggable-on'
gem 'acts_as_follower', github: 'tcocca/acts_as_follower', branch: 'master'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'carrierwave'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'dotenv-rails'
gem 'fog-aws'
gem 'geocoder'
gem 'gmaps4rails'
gem 'kaminari'
gem 'mini_magick'
gem 'rails-i18n'
gem 'ransack'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rspec-retry'
  gem 'rspec_junit_formatter'
  gem 'pry-rails'
  gem 'faker'
end

group :development do

  gem 'listen'
  gem 'annotate'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'html2slim'
  gem 'pre-commit', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'solargraph'
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'capybara-email'
  gem 'email_spec'
  gem 'launchy'
gem 'shoulda-matchers', '~> 5.0'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
