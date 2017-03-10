source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.0.beta1'
gem 'mysql2'
gem 'puma', '~> 3.7'
gem 'sass-rails', github: "rails/sass-rails"
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'

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
  # gem 'poltergeist', '~> 1.6.0'
  gem 'selenium-webdriver'
end

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
gem 'bootstrap-sass', '~> 3.3' # bootstrap
gem 'autoprefixer-rails' # css prefixer
gem 'acts-as-taggable-on' # tags for Post
gem 'metamagic' # meta keywords and description
gem "redcarpet"
gem 'redactor-rails'
gem 'cancancan', '~> 1.10'

gem 'nprogress-rails' # turbolinks progressbar
gem 'closure_tree'
gem 'jquery-turbolinks'
# gem 'search_cop'
gem 'sunspot_rails'
gem 'sunspot_solr'
gem 'font-awesome-rails'

