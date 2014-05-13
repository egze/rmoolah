# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rmoolah/version'

Gem::Specification.new do |spec|
  spec.name          = "rmoolah"
  spec.version       = Rmoolah::VERSION
  spec.authors       = ["Aleksandr Lossenko"]
  spec.email         = ["aleksandr.lossenko@gmail.com"]
  spec.summary       = %q{API wrapper for moolah.io}
  spec.description   = %q{With moolah.io you can process payments in-store and online. Rmoolah is a API wrapper for moolah.io}
  spec.homepage      = "https://github.com/egze/rmoolah"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_runtime_dependency 'httparty', '~> 0.13'
  
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "minitest", "~> 4.7"
  spec.add_development_dependency "webmock", "~> 1.18"
end
