# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pecha_kucha_session',
  :secret      => 'db1dac98b235c641d626a3e5d410d1b92cfe002c038bcd8cfe99e63074d509fe39df95affd49882d09b0f1172a201d3e3b24ffcc5da544af294eca6986f6efbc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
