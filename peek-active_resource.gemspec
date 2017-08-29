# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'peek-active_resource/version'

Gem::Specification.new do |spec|
  spec.name          = "peek-active_resource"
  spec.version       = Peek::ActiveResource::VERSION
  spec.authors       = ["Mike Mayo"]
  spec.email         = ["gotmayonase@gmail.com"]
  spec.description   = %q{Take a speec into the ActiveResource requests made during your app's requests.}
  spec.summary       = %q{Take a speec into the ActiveResource requests made during your app's requests.}
  spec.homepage      = "https://github.com/gotmayonase/peek-actve_resource"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'peek'
  spec.add_dependency 'activeresource'
  spec.add_dependency 'concurrent-ruby'
end
