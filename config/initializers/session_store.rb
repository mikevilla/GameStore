# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_game_site_session',
  :secret      => '9b8b3a7f773a4d42c1ea29fd60b8d48d4a0d754fb0394258ccbcd6caaa510bb109d507cf51a78cd1a35b20b34c4117f048fdb7baa88be05ac7b8d62a73bea54c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
