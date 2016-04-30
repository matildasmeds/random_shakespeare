# coding: utf-8
require_relative 'lib/random_shakespeare/version'

Gem::Specification.new do |spec|
  spec.name          = "random_shakespeare"
  spec.version       = RandomShakespeare::VERSION
  spec.authors       = ["Matilda Smeds"]
  spec.email         = ["matilda.smeds@gmail.com"]

  spec.summary       = "RandomShakespeare gives you random quotes from Macbeth."
  spec.description   = "Usage: \
                        require 'random_shakespeare'
                        random_shakespeare"
  spec.homepage      = "https://github.com/matildasmeds/random_shakespeare"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "nokogiri", "1.6.7"
  spec.add_runtime_dependency "activesupport", "4.2.6"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "1.24.5"
end
