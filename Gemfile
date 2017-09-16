source 'https://rubygems.org'

gem 'bcrypt'
gem 'graphql'
gem 'hanami',       '~> 1.0'
gem 'hanami-model', '~> 1.0'
gem 'httparty'
gem 'pg'
gem 'rake'
gem 'sass'

group :development do
  gem 'byebug'
  gem 'capistrano'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rbenv'
  gem 'capistrano3-puma'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'rubocop', '~> 0.50.0', require: false
  # Code reloading
  # See: http://hanamirb.org/guides/applications/code-reloading
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'capybara'
  gem 'factory_girl'
  gem 'rspec'
end

group :production do
  gem 'puma'
end
