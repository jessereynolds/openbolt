# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'bolt/version'

Gem::Specification.new do |spec|
  spec.name          = "openbolt"
  spec.version       = Bolt::VERSION
  spec.authors       = ['OpenVox Project']
  spec.email         = ['openvox@voxpupuli.org']

  spec.summary       = "Execute commands remotely over SSH and WinRM"
  spec.description   = "Execute commands remotely over SSH and WinRM"
  spec.homepage      = 'https://github.com/OpenVoxProject/openbolt/'
  spec.license       = "Apache-2.0"
  spec.files         = Dir['exe/*'] +
                       Dir['lib/**/*.rb'] +
                       Dir['lib/**/*.json'] +
                       Dir['libexec/*'] +
                       Dir['bolt-modules/*/lib/**/*.rb'] +
                       Dir['bolt-modules/*/types/**/*.pp'] +
                       Dir['modules/*/metadata.json'] +
                       Dir['modules/*/bolt_plugin.json'] +
                       Dir['modules/*/data/**/*'] +
                       Dir['modules/*/facts.d/**/*'] +
                       Dir['modules/*/files/**/*'] +
                       Dir['modules/*/functions/**/*'] +
                       Dir['modules/*/lib/**/*.rb'] +
                       Dir['modules/*/locales/**/*'] +
                       Dir['modules/*/manifests/**/*'] +
                       Dir['modules/*/plans/**/*.pp'] +
                       Dir['modules/*/tasks/**/*'] +
                       Dir['modules/*/templates/**/*'] +
                       Dir['modules/*/types/**/*'] +
                       Dir['Puppetfile'] +
                       Dir['resources/bolt_bash_completion.sh'] +
                       Dir['guides/*.yaml']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.2"

  spec.add_dependency "addressable", '~> 2.5'
  spec.add_dependency "aws-sdk-ec2", '~> 1'
  spec.add_dependency "CFPropertyList", ">= 2.2"
  spec.add_dependency "concurrent-ruby", "~> 1.0"
  spec.add_dependency "ffi", ">= 1.9.25", "< 2.0.0"
  spec.add_dependency "hiera-eyaml", "~> 3"
  spec.add_dependency "json", "~> 2.12.0"
  spec.add_dependency "jwt", "~> 2.2"
  spec.add_dependency "logging", "~> 2.2"
  spec.add_dependency "minitar", "~> 0.6"
  spec.add_dependency "net-scp", ">= 1.2", "< 5.0"
  spec.add_dependency "net-ssh", ">= 4.0", "< 8.0"
  spec.add_dependency "net-ssh-krb", "~> 0.5"
  spec.add_dependency "openvox", "~> 8.0"
  spec.add_dependency "openvox-strings", '~> 5.0'
  spec.add_dependency "orchestrator_client", "~> 0.7"
  spec.add_dependency "puppetfile-resolver", ">= 0.6.2", "< 1.0"
  spec.add_dependency "puppet-resource_api", ">= 1.8.1"
  spec.add_dependency "r10k", ">= 3.10", "< 5"
  spec.add_dependency "ruby_smb", "~> 1.0"
  spec.add_dependency "terminal-table", "~> 3.0"
  spec.add_dependency "winrm", "~> 2.0"
  spec.add_dependency "winrm-fs", "~> 1.3"

  spec.add_development_dependency "bundler", ">= 1.14"
  spec.add_development_dependency "octokit", ">= 4.0", "< 9"
  spec.add_development_dependency "rake", ">= 12.0", "< 14"
  spec.add_development_dependency "rspec", ">= 3.0", "< 4"
  spec.add_development_dependency 'voxpupuli-rubocop', '~> 4.1.0'
end
