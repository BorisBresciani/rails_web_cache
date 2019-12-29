# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'rails_web_cache/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'rails_web_cache'
  spec.version     = RailsWebCache::VERSION
  spec.authors     = ['Boris BRESCIANI']
  spec.email       = ['boris2bresciani@gmail.com']

  spec.summary       = 'Manage rails cache by Web UI'
  spec.description   = 'Manage rails cache by Web UI (Redis, Memory, etc...)'
  spec.homepage      = 'https://github.com/BorisBresciani/rails_web_cache'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0")
                     .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.test_files = Dir['spec/**/*']

  spec.add_development_dependency 'coveralls', '~> 0.8'
  spec.add_development_dependency 'rspec-rails', '= 4.0.0.beta3'
  spec.add_development_dependency 'simplecov', '~> 0.16'

  spec.add_dependency 'rails', '>= 5.2', '< 7.0'
end
