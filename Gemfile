source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.1"

gem "autoprefixer-rails"
gem "delayed_job_active_record"
gem "flutie"
gem "honeybadger"
gem "jquery-rails"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.1.3"
gem "recipient_interceptor"
gem 'sass-rails', '~> 5.0', '>= 5.0.6'
gem "simple_form"
gem "skylight"
gem "sprockets", ">= 3.0.0"
gem "suspenders"
gem "title"
gem "uglifier"


group :development do
  gem "listen"
  gem "rack-mini-profiler", require: false
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.6"
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :production do
  gem "rack-timeout"
end

# UI
gem 'high_voltage'
gem 'foundation-rails', '~> 6.4', '>= 6.4.1.2'

## app specific
gem 'fuzzy_match', '~> 2.1' # best match strings
gem 'responders', '~> 2.2' #putting back responders into rails. Hey DHH, :P.
gem 'rails_12factor', '~> 0.0.3' # better heroku hosting 

#consume json api
gem 'httparty', '~> 0.15.6' # grab the contents of a url
gem 'crack', '~> 0.4.3' # parse the xml or json of that page
gem 'faraday', '~> 0.9.2' 
gem 'faraday_middleware', '~> 0.10.0'
gem 'mechanize', '~> 2.7', '>= 2.7.4'
gem 'foursquare2', '~> 2.0', '>= 2.0.2'
gem 'representable', '~> 3.0', '>= 3.0.4'
gem 'multi_json', '~> 1.12', '>= 1.12.2'
# gem 'flickraw', '~> 0.9.9'
