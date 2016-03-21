# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'to_zh/version'

Gem::Specification.new do |spec|
  spec.name          = "to_zh"
  spec.version       = ToZh::VERSION
  spec.authors       = ["Gary"]
  spec.email         = ["gary@gary-lai.com"]

  spec.summary       = %q{Translates Arabic numbers to upper-traditional Chinese numbers and lower-traditional Chinese numbers.}
  spec.description   = %q{ToZh can translate Arabic numbers to upper-traditional Chinese numbers and/or to lower-traditional Chinese numbers.}
  spec.homepage      = "https://github.com/imgarylai/to_zh"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
