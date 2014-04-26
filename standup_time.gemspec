# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'standup_time/version'

Gem::Specification.new do |spec|
  spec.name          = "standup_time"
  spec.version       = StandupTime::VERSION
  spec.authors       = ["Mike Coutermarsh"]
  spec.email         = ["coutermarsh.mike@gmail.com"]
  spec.summary       = %q{Write a short summary. Required.}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['standup_time'] 
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'octokit', '~> 2.0'
  spec.add_dependency 'netrc', '~> 0.7.7'
  spec.add_dependency 'activesupport', '~> 4.1.0'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-debugger"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
