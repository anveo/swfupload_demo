# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_swfupload_demo_session',
  :secret      => '34ba95dcb6743340237ac3e71a0dd151926ff6d7bf6df0916bbf2465ca984ffe88fe4cf9d6017335aca6572940b2ce004ce15f5f787c368a78aa60d0109db69f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
