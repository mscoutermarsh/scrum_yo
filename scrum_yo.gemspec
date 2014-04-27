# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scrum_yo/version'

Gem::Specification.new do |spec|
  spec.name          = "scrum_yo"
  spec.version       = ScrumYo::VERSION
  spec.authors       = ["Mike Coutermarsh"]
  spec.email         = ["coutermarsh.mike@gmail.com"]
  spec.summary       = %q{Be awesome at your daily stand up with a summary of all your recent GitHub Activity.}
  spec.description   = %q{ScrumYo! G}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['scrumyo'] 
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'octokit', '~> 2.0'
  spec.add_dependency 'netrc', '~> 0.7.7'
  spec.add_dependency 'activesupport', '~> 4.1.0'
  spec.add_dependency 'colorize'
  spec.add_dependency 'highline'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-debugger"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
