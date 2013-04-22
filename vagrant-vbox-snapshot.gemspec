$:.unshift File.expand_path('../lib', __FILE__)
require 'vagrant-vbox-snapshot/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-vbox-snapshot"
  spec.version       = VagrantPlugins::VBoxSnapshot::VERSION
  spec.authors       = "Alex Dergachev"
  spec.email         = "alex@evolvingweb.ca"
  spec.summary       = 'Vagrant plugin that exposes the `VBoxManage snapshot` command.'
  spec.description   = 'Vagrant plugin that exposes the `VBoxManage snapshot` command.'
  spec.homepage      = 'https://github.com/dergachev/vagrant-vbox-snapshot'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_path  = 'lib'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
