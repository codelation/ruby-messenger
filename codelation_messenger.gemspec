# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codelation_messenger/version'

Gem::Specification.new do |spec|
  spec.name          = "codelation_messenger"
  spec.version       = CodelationMessenger::VERSION
  spec.authors       = ["Jake Humphrey"]
  spec.email         = ["jake@codelation.com"]

  spec.summary       = "Sends a message to the messenger worker"
  spec.description   = "Used to send messages to a micro service and either wait for a response or do an async request"
  spec.homepage      = "https://github.com/codelation/ruby-messenger.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "rest-client"
end
