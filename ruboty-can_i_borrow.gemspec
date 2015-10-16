# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/can_i_borrow/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-can_i_borrow"
  spec.version       = Ruboty::CanIBorrow::VERSION
  spec.authors       = ["akira.takahashi"]
  spec.email         = ["rike422@gmail.com"]
  spec.summary       = %q{Logging lending record and check lending status}
  spec.description   = %q{Logging lending record and check lending status}
  spec.homepage      = "https://github.com/rike422/ruboty-can_i_borrow"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ruboty"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
