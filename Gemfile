source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'aasm' # state machine
gem 'acts-as-taggable-on' # tags for Post
gem 'autoprefixer-rails' # css prefixer
gem 'bootstrap-sass', '~> 3.3' # bootstrap
gem 'cancancan', '~> 1.10'
gem 'carrierwave' # file upload
gem 'closure_tree'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'font-awesome-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'kaminari' # paginations
gem 'metamagic' # meta keywords and description
gem 'mini_magick' # image processing
gem 'mysql2'
gem 'nprogress-rails' # turbolinks progressbar
gem 'omniauth'
gem 'omniauth-vkontakte'
gem 'omniauth-github'
# gem 'omniauth-twitter'
# gem 'omniauth-facebook'
# gem 'omniauth-linkedin'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.0.2'#, github: 'rails/rails'
gem "redcarpet"
gem 'redactor-rails'
gem 'russian' # russian lang
gem 'sass-rails', github: "rails/sass-rails"
gem 'slim-rails'
gem 'sunspot_rails'
gem 'sunspot_solr'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'annotate', '~> 2.6.5'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sextant'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'utf8-cleaner'
end

group :test, :development do
  gem 'awesome_print'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.7.0'
  gem "database_cleaner"
  gem "factory_girl_rails", "~> 4.0"
  gem "faker"
  gem "rspec-rails", "~> 3.0"
  # gem 'poltergeist'
  # gem 'selenium-webdriver'
  gem 'capybara-webkit'
  gem 'launchy'
end

