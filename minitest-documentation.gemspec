# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "minitest-documentation"
  spec.version       = "0.0.1"
  spec.authors       = ["Teo Ljungberg"]
  spec.email         = ["teo.ljungberg@gmail.com"]
  spec.summary       = %q{Rspec like documentation for Minitest}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/teoljungberg/minitest-documentation"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
