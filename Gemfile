source 'https://rubygems.org'
ruby "2.0.0"
group :development, :test do
  # foreman start
  gem 'foreman'

  # To get random images
  gem 'image_suckr', github: 'rayros/image_suckr'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Guard rspec
  gem 'guard-rspec', require: false
  # Rspec
  gem 'rspec-rails'
  # Factory girl
  gem 'factory_girl_rails'
  # Better errors
  gem "better_errors"
  gem "binding_of_caller"
  # Annotate
  # Tableki w bd dla modelu na górze
  gem 'annotate'
  # Flay
  # Szukanie podobieństw w kodzie
  gem 'flay'
  # ruby2ruby
  # require for flay --diff
  gem 'ruby2ruby'
  gem "hirb"
  gem "rails_best_practices"
  gem 'railroady'
end

gem 'simplecov', :require => false, :group => :test
group :production do
  # Use postgresql as the database for Active Record
  gem 'pg'

  # Heroku gem
  gem 'rails_12factor'

  # Heroku deflater
  gem 'heroku-deflater'
end
# Facebook query language
gem 'fql'
# will_paginate
gem 'will_paginate-bootstrap'

# Bootstrap
gem 'bootstrap-sass'
gem 'bootstrap-filestyle-rails', github: 'rayros/bootstrap-filestyle-rails'
# FlatUI
#gem 'flatui-rails', github: 'pkurek/flatui-rails'

# http://decentexposure.info/
gem 'decent_exposure'

# To generate fake data
gem 'faker'

# Devise
gem 'devise'

# Fog to send sitemap.xml to amazon s3
gem 'fog'
# Sitemap generator
gem 'sitemap_generator'

# FriendlyId
gem 'friendly_id', '~> 5.0.0'

# HAML
gem "haml-rails"

# AWS S3 AMAZON
gem 'aws-sdk'

# Paperclip
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
