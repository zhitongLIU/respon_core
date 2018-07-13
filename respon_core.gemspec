# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'respon_core/version'

Gem::Specification.new do |spec|
  spec.name          = 'respon_core'
  spec.version       = ResponCore::VERSION
  spec.authors       = ['zhitongLIU']
  spec.email         = ['zhitonggm.liu@gmail.com']

  spec.summary       = 'core gem for respon'
  spec.description   = 'core gem for respon'
  spec.homepage      = 'http://www.google.com'
  spec.license       = 'MIT'

  spec.bindir = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.files += %w[CONTRIBUTING.md LICENSE.md README.md respon_core.gemspec Rakefile]
  spec.files += Dir.glob('lib/**/*.rb')
  spec.files += Dir.glob('concepts/**/*.rb')

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib concepts]

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
