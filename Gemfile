source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.0'
gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'
gem 'bootstrap', '~> 4.3.1'
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'sassc-rails', '>= 2.1.0'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 4.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'acts-as-taggable-on'
gem 'acts_as_follower', github: 'tcocca/acts_as_follower', branch: 'master'
gem 'bootsnap', '>= 1.1.0', require: false

# 画像処理
gem 'carrierwave'
gem 'mini_magick'
gem 'fog-aws'

# ログイン周り
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'

# Goole Map API
gem 'geocoder'
gem 'gmaps4rails'

gem 'rails-i18n'
gem 'kaminari'
gem 'ransack'
gem 'dotenv-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'

  gem 'pry-byebug'
  gem 'pry-rails'

  gem 'rspec-rails'
  gem 'rspec-retry'
  gem 'rspec_junit_formatter'
  gem 'factory_bot_rails'
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
