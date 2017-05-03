# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dolla/version'

Gem::Specification.new do |spec|
  spec.name          = "dolla"
  spec.version       = Dolla::VERSION
  spec.authors       = ["Tamiswanashe Chipika"]
  spec.email         = ["tami@dollapayments.com"]

  spec.summary       = %q{Client library for Dolla Payments API}
  spec.description   = %q{Ruby bindings for Dolla Payments API}
  spec.homepage      = "https://dollapayments.com/api/ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  # for some reason, json_api_client's lax dependency requirements make it try to install activesupport 5 when running
  # bundle install when trying to test the library itself
  spec.add_dependency("activesupport", "~> 4.3")
  
  spec.add_dependency('json_api_client', '1.5.1')

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "webmock", "~> 1.21.0"
end
