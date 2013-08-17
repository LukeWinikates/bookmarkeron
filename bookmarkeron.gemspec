# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bookmarkeron/version'

Gem::Specification.new do |spec|
  spec.name          = "bookmarkeron"
  spec.version       = Bookmarkeron::VERSION
  spec.authors       = ["rukednous"]
  spec.email         = ["luke.winikates@gmail.com"]
  spec.description   = %q{declare bookmarks in a yaml file, merge them into your Chrome bookmarks}
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "awesome_print"
end
