require_relative 'lib/serpapi/version'

Gem::Specification.new do |spec|
  spec.name        = 'serpapi'
  spec.version     = Serpapi::VERSION
  spec.authors     = ['Usman']
  spec.email       = ['uxman.sherwani@gmail.com']
  spec.homepage    = 'https://github.com/bfrocks/serpapi'
  spec.summary     = 'Serpapi Wrapper'
  spec.description = 'Serpapi Wrapper Rails Engine.'

  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.files = Dir['{app,config,db,lib}/**/*', 'README.md']

  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'rails'
end
