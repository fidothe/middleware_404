source 'https://rubygems.org'

gem 'bundler'
gem 'rake'

gem 'hanami-utils',       require: false, github: 'hanami/utils'
gem 'hanami-router',      require: false, github: 'hanami/router'
gem 'hanami-validations', require: false, github: 'hanami/validations'
gem 'hanami-helpers',     require: false, github: 'hanami/helpers'
gem 'hanami-controller',  require: false, github: 'hanami/controller'
gem 'hanami-view',        require: false, github: 'hanami/view'
gem 'hanami-model',       require: false, github: 'hanami/model'
gem 'hanami-mailer',      require: false, github: 'hanami/mailer'
gem 'hanami-assets',      require: false, github: 'hanami/assets'
gem 'hanami',                             github: 'hanami/hanami'

group :development do
  # Code reloading
  # See: [LINK TO HANAMI GUIDES]
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
