# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kazoo-ruby-sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "kazoo-ruby-sdk"
  spec.version       = KazooRubySdk::VERSION
  spec.authors       = ["Aleksey Pohodnya"]
  spec.email         = ["pohodnyaa@gmail.com"]

  spec.summary       = 'SDK for Kazoo API'
  spec.description   = 'You can specify the data to access your Kazoo server and use the Kazoo API using the methods of this sdk.'
  spec.homepage      = "https://github.com/pohodnya/kazoo-ruby-sdk"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'multi_json'
  spec.add_dependency 'hashie'
  spec.add_dependency 'yajl-ruby'
end
