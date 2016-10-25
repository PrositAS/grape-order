# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grape/order/version'

Gem::Specification.new do |spec|
  spec.name          = "grape-order"
  spec.version       = Grape::Order::VERSION
  spec.authors       = ["Grzegorz Brzezinka"]
  spec.email         = ["greg@prosit.no"]
  spec.description   = %q{collection ordering by params for grape API framework}
  spec.summary       = %q{collection ordering for grape}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_runtime_dependency "grape"
  spec.add_runtime_dependency "activerecord", "> 4.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", "~> 2.9"
end