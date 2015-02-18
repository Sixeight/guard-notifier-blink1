# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard-notifier-blink1/version'

Gem::Specification.new do |spec|
  spec.name          = "guard-notifier-blink1"
  spec.version       = GuardNotifierBlink1::VERSION
  spec.authors       = ["Tomohiro Nishimura"]
  spec.email         = ["tomohiro68@gmail.com"]
  spec.summary       = %q{blink(1) notifier for Guard.}
  spec.description   = %q{blink(1) notifier for Guard.}
  spec.homepage      = "https://github.com/Sixeight/guard-notifier-blink1"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "guard", "~> 2.9"
  spec.add_runtime_dependency "colorable", "~> 0.2.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

