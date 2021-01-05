# Database Cleaner Adapter for LDAP

Clean your LDAP Database with Database Cleaner.

## Installation

Add this line to your application's Gemfile:

```ruby
# Gemfile
group :test do
  gem 'database_cleaner-ldap', '~> 0.1.0'
end
```

## Usage

### RSpec Example

```ruby
# spec/support/database_cleaner.rb

require 'database_cleaner/ldap'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner[:ldap, db: Net::LDAP.new].strategy = :deletion, {
      # Clean posixGroups and posixAccounts only, don't touch other LDAP entries
      filter: Net::LDAP::Filter.eq('objectClass', 'posixGroup') | Net::LDAP::Filter.eq('objectClass', 'posixAccount')
    }
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning { example.run }
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/database_cleaner-ldap. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/database_cleaner-ldap/blob/master/CODE_OF_CONDUCT.md).


## Code of Conduct

Everyone interacting in the DatabaseCleaner::Ldap project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/database_cleaner-ldap/blob/master/CODE_OF_CONDUCT.md).
