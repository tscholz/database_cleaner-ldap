require "net/ldap"
require "database_cleaner/core"

require "database_cleaner/ldap/version"
require "database_cleaner/ldap/deletion"

module DatabaseCleaner
  module Ldap

  end
end

# This triggers the DATABASE_URL safeguard before it can be configured. :( TODO file an issue on the Database Cleaner project
# DatabaseCleaner[:ldap].strategy = :deletion
