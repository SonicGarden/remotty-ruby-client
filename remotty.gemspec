# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'remotty/version'

Gem::Specification.new do |spec|
  spec.name          = "remotty"
  spec.version       = Remotty::VERSION
  spec.authors       = ["SonicGarden"]
  spec.email         = ["luckofwise@sonicgarden.jp"]

  spec.summary       = %q{Remotty Ruby Client}
  spec.description   = %q{Remotty Ruby Client}
  spec.homepage      = "https://github.com/SonicGarden/remotty-ruby-client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "oauth2"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
