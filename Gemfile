source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem "rails", "~> 7.0.8"
gem "sprockets-rails"
gem "pg"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

#styling & Javascript
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "sassc-rails"

gem "jbuilder"

gem "devise"

gem "image_processing", "~> 1.2"
gem "aws-sdk-s3", "~> 1"

# Deployment
gem 'capistrano', '< 5'
gem 'capistrano-rvm'
gem 'capistrano-rails'
gem 'capistrano-bundler'
gem 'capistrano3-puma', '< 5'
gem 'capistrano3-nginx'
gem 'capistrano-rails-console'
gem 'capistrano-rails-tail-log'
gem 'capistrano-rails-db'
gem 'capistrano-rake', require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Deployment
  gem 'capistrano', '< 5'
  gem 'capistrano-rvm'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano3-puma', '< 5'
  gem 'capistrano3-nginx'
  gem 'capistrano-rails-console'
  gem 'capistrano-rails-tail-log'
  gem 'capistrano-rails-db'
  gem 'capistrano-rake', require: false

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"

end
