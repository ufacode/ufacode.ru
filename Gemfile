source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# authentication
gem 'devise'
gem 'omniauth'
# gem 'omniauth-twitter'
# gem 'omniauth-facebook'
# gem 'omniauth-linkedin'
gem 'omniauth-vkontakte'
gem 'omniauth-github'

gem 'russian' # russian lang
gem 'kaminari' # paginations
gem 'mini_magick' # image processing
gem 'carrierwave' # file upload
gem 'aasm' # state machine
gem 'airbrake' # errbit notifications
gem 'bootstrap-sass', '~> 3.3' # bootstrap
gem 'autoprefixer-rails' # css prefixer
gem 'acts-as-taggable-on' # tags for Post
gem 'metamagic' # meta keywords and description
gem 'rails_config'
gem "redcarpet"
gem 'markitup-rails'

group :development do
  # gem 'net-ssh', "~> 2.7.0"
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'sextant'
  gem 'quiet_assets'
  gem 'bullet'
  gem 'annotate', '~> 2.6.5'
end

group :production do
  gem 'utf8-cleaner'
end

group :test, :development do
  gem 'spring'
  gem 'byebug'
  gem 'web-console', '~> 2.0'

  gem "rspec-rails", "~> 3.0"
  gem "factory_girl_rails", "~> 4.0"
  gem "faker"
  gem "capybara"
  gem "database_cleaner"
end
