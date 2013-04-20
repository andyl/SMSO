source 'https://rubygems.org'

ruby "1.9.3"

# ----- rails -----
gem 'rails',          '3.2.13'

# ----- databases -----
gem 'pg'        # SQL datastore
gem 'redis'     # key-value datastore (caching, job queueing)
gem 'yaml_db'   # for backup and restore

# ----- jquery - maybe need to replace ??? -----
gem 'jquery-rails'

# ----- misc -----
gem 'bcrypt-ruby', '~> 3.0.0'   # for 'has-secure-password'
gem 'parslet'                   # for address and name parsers

# ----- web servers -----
gem 'thin'
gem 'unicorn'

# ----- console tools -----
gem "hirb"
gem "wirble"
gem "interactive_editor"
gem "awesome_print", :require => "ap"
gem "rb-readline"

# ----- process managers -----
gem "sidekiq"                     # background job queue manager
gem "foreman"                     # init/upstart - see 'Procfile'
gem "whenever", :require => false # cron jobs - see 'schedule.rb'

# ----- rails4 compatibility -----
gem 'strong_parameters'
gem 'cache_digests'

group :assets do
  # rails4 compatibility - fast asset compile
  gem 'turbo-sprockets-rails3'

  gem 'therubyracer',    platforms: :ruby
  gem 'uglifier',        '>= 1.0.3'
  gem 'sass-rails',      '~> 3.2.3'  # CSS framework
  gem 'coffee-rails',    '~> 3.2.1'  # coffeescript support
  gem 'zurb-foundation', '~> 4.0.0'  # ui framework
  gem 'teabag'                       # framework for javascript unit tests
end

group :development, :test do
  # ----- capistrano -----
  gem 'capistrano'
  gem 'capistrano_colors'

  # ----- debugger -----
  gem 'debugger'

  # ----- rspec -----
  gem "webrat"                       # supplies 'contain' matcher for view specs...
  gem "launchy"                      # needed for 'save and open page'
  gem "capybara"                     # used for feature specs
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "database_cleaner"
  gem "factory_girl_rails"
  gem "rspec-on-rails-matchers"

  # ----- add DB fields to models & specs -----
  gem "annotate"

end
