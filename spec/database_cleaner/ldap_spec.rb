require "database_cleaner/spec"

RSpec.describe DatabaseCleaner::Ldap do
  it "has a version number" do
    expect(DatabaseCleaner::Ldap::VERSION).not_to be nil
  end

  it_behaves_like "a database_cleaner adapter"
end
