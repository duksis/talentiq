# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "talentiq/version"

Gem::Specification.new do |spec|
  spec.name          = "talentiq"
  spec.version       = TalentIQ::VERSION
  spec.authors       = ["Hugo Duksis"]
  spec.email         = ["duksis@gmail.com"]

  spec.summary       = %q{TalentIQ API client library in Ruby}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/duksis/talentiq"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.3"
end
