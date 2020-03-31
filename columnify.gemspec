
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "columnify/version"

Gem::Specification.new do |spec|
  spec.name = "columnify"
  spec.version = Columnify::VERSION
  spec.authors = ["Abraham Kuri"]
  spec.email = ["kurenn@icalialabs.com"]

  spec.summary = %q{A simple Excel & CSV Rails Responder}
  spec.description = %q{A powerful Rails responder to create Excel & CSV files with ease}
  spec.homepage = "https://github.com/kurenn/columnify"
  spec.license = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "spreadsheet"
  spec.add_dependency 'rails', '>= 5.0', '<= 6.0'

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
