# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cta_track/version'

Gem::Specification.new do |spec|
  spec.name          = "cta_track"
  spec.version       = CtaTrack::VERSION
  spec.authors       = ["rdalin82"]
  spec.email         = ["Robert.Dalin@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{This is a gem that interacts with CTA's public bus API }
  spec.description   = %q{This gem is designed to pull data from the CTA public api and present it in a useable format that is easy to display in a webpage or other application}
  spec.homepage      = "https://github.com/rdalin82/CtaTrack"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri"
end
