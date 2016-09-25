# my rails template

def source_paths
	Array(super)
	[File.expand_path(File.dirname(__FILE__))]
end


#You may want to tap and existing gemset or go this method to make it easier for
#others to check it out.
#Plus, you dont have to remove the comments in the Gemfile
remove_file "Gemfile"
run "touch Gemfile"
gem 'font-awesome-sass'

add_source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'
gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'kaminari'
gem 'httparty'
gem "bcrypt-ruby", :require => "bcrypt"
gem "twitter-bootstrap-rails"
gem 'local_time'
gem 'therubyracer'

gem_group :development, :test do
  gem 'rack-mini-profiler', require: false
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

after_bundle do
  generate 'bootstrap:install static'
  # rails generate bootstrap:install static

  generate(:controller, "user", "new")
  generate(:model, "user", "user:string", "mail:string", "password_salt:string", "password_hash:string")
  generate(:controller, "sessions", "new")


  rake 'db:migrate'


end





