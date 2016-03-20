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
  spec.description   = %q{
    ToZh can translate Arabic numbers to upper-traditional Chinese numbers and/or to lower-traditional Chinese numbers.
    Example: "1234567890" -> "壹拾貳億叁仟肆佰伍拾陸萬柒仟捌佰玖拾"
    or
    Example: "1234567890" -> "一十二億三千四百五十六萬七千八百九十"}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
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
