# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grape/sort/version'

Gem::Specification.new do |spec|
  spec.name          = "grape-sort"
  spec.version       = Grape::Sort::VERSION
  spec.authors       = ["Grzegorz Brzezinka"]
  spec.email         = ["greg@prosit.no"]
  spec.description   = %q{collection sorting by params for grape API framework}
  spec.summary       = %q{collection sorting for grape}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_runtime_dependency "grape"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '~> 2.9'
end