source 'https://rubygems.org'

ruby "1.9.3"

# ----- rails -----
gem 'rails', '3.2.13'

# ----- databases -----
gem 'pg'        # SQL datastore
gem 'redis'     # key-value datastore (caching, job queueing)
gem 'yaml_db'   # for backup and restore

# ----- jquery - maybe need to replace ??? -----
gem 'jquery-rails'

# ----- misc -----
gem 'bcrypt-ruby', '~> 3.0.0'   # for 'has-secure-password'
gem 'cancan'                    # access control
gem 'parslet'                   # for address and name parsers
gem 'font-awesome-rails'        # icon fonts

# ----- web servers -----
gem 'thin'
gem 'unicorn'

# ----- console tools -----
gem "hirb"                     # table-display
gem "wirble"                   # colorized IRB display
gem "interactive_editor"       # enter 'vim' from the console
gem "rb-readline"              # up and down arrows

# ----- process managers -----
gem "sidekiq"                     # background job queue manager
gem "foreman"                     # init/upstart - see 'Procfile'
gem "whenever", :require => false # cron jobs - see 'schedule.rb'

# ----- rails4 compatibility -----
gem 'strong_parameters'
gem 'cache_digests'

group :assets do
  # for rails4 compatibility - fast asset compile
  gem 'turbo-sprockets-rails3'

  gem 'therubyracer',    platforms: :ruby
  gem 'uglifier',        '>= 1.0.3'
  gem 'sass-rails',      '~> 3.2.3'  # CSS framework
  gem 'coffee-rails',    '~> 3.2.1'  # coffeescript support
  gem 'zurb-foundation', '~> 4.1.6'  # ui framework
end

group :development, :test do
  # ----- capistrano -----
  gem 'capistrano'
  gem 'capistrano_colors'

  # ----- debugger -----
  gem 'debugger'

  # ----- rspec -----
  gem "webrat"                   # 'contain' matcher for view specs...
  gem "launchy"                  # needed for 'save and open page'
  gem "capybara"                 # used for feature specs
  gem "rspec-rails"              # RSPEC
  gem "capybara-webkit", github: 'thoughtbot/capybara-webkit', branch: 'master'
  gem "shoulda-matchers"         # 'should_belong_to' matchers
  gem "database_cleaner"         # empty database between test runs
  gem "factory_girl_rails"       # defined in spec/factory.rb

  # ----- teabag -----
  gem 'teabag'                   # framework for javascript unit tests

  # ----- add DB fields to models & specs -----
  gem "annotate"

end
