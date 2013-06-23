# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'joosy/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'joosy-rails'
  spec.version       = Joosy::Rails::VERSION
  spec.authors       = ['Boris Staal']
  spec.email         = ['boris@staal.io']
  spec.summary       = 'Joosy Rails ties'
  spec.description   = 'Assets, Generators and beer delivery'
  spec.homepage      = 'http://github.com/joosy/rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'joosy', '>= 1.2.0.alpha'
  spec.add_dependency 'sprockets'
  spec.add_dependency 'execjs'
  spec.add_dependency 'ejs'

  spec.add_development_dependency 'rake'
end
