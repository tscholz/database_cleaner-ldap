require_relative 'lib/database_cleaner/ldap/version'

Gem::Specification.new do |spec|
  spec.name          = "database_cleaner-ldap"
  spec.version       = DatabaseCleaner::Ldap::VERSION
  spec.authors       = ["Thomas Scholz"]
  spec.email         = ["thomas.scholz@swisscom.com"]

  spec.summary       = %q{Strategy for cleaning LDAP databases. Can be used to ensure a clean state for testing.}
  spec.description   = %q{Strategy for cleaning LDAP databases. Can be used to ensure a clean state for testing.}
  spec.homepage      = "https://github.com/tscholz/database_cleaner-ldap"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tscholz/database_cleaner-ldap"
  spec.metadata["changelog_uri"] = "https://github.com/tscholz/database_cleaner-ldap/CHANGELOG"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "database_cleaner-core", ">= 2.0.0", "< 3.0"
  spec.add_dependency "net-ldap", ">= 0.16.0", "< 1.0"
end
