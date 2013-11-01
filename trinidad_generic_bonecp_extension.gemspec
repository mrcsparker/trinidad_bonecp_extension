# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name = 'trinidad_generic_bonecp_extension'
  gem.version = '1.0.0'

  gem.summary = 'Addon to support generic bonecp database pools in Trinidad'
  gem.description = 'Addon to support generic bonecp database pools in Trinidad'
  gem.homepage = 'http://github.com/mrcsparker/trinidad_bonecp_extension'
  gem.authors = ['Chris Parker']
  gem.email = ['mrcsparker@gmail.com']
  gem.license = 'MIT'

  gem.files =  ['lib/trinidad_generic_bonecp_extension.rb'] +
  `git ls-files lib/trinidad_generic_bonecp_extension/*.rb`.split("\n") +
  `git ls-files `.split("\n").
    select { |name| File.dirname(name) == File.dirname(__FILE__) }.
    select { |name| name !~ /^\./ && name !~ /gemspec/ }

  gem.require_paths = ['lib']

  gem.extra_rdoc_files = [ 'README.md', 'LICENSE' ]

  gem.add_dependency('trinidad_bonecp', '>= 1.0.0')
  gem.add_development_dependency('rspec', '>= 2.10')
  gem.add_development_dependency('mocha', '>= 0.10')
end
