# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'name_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "name_generator"
  spec.version       = NameGenerator::VERSION
  spec.authors       = ["Matt Oakley"]
  spec.email         = ["matt.oakley@hashbanghq.com"]
  spec.description   = %q{Given a nationality in ISO 3166-1 alpha-2 format, the gem will return a randomly generated name.}
  spec.summary       = %q{Generate random first/last names based on nationality}
  spec.homepage      = "http://hashbanghq.com/name-generator"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('i18n')

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
