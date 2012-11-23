source 'http://rubygems.org'

gem 'rails', '3.0.7'
gem 'mysql2', '0.2.7'
gem "bcrypt-ruby", '2.1.4', :require => "bcrypt"

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:

# Heroku has a problem with this
group :development, :test do
  gem 'nifty-generators'
end
gem "mocha", :group => :test
