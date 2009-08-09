# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_30days_session',
  :secret      => '71d2acaba90d4c83dff04ff2e6c779f57451abebc3fb5faa6099c0c4f1c0d04c55427bb21a193cf1e607e827e0e075641b515e46363d40e790bfc3c1a78b664a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
