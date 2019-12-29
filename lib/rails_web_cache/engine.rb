# frozen_string_literal: true

module RailsWebCache
  class Engine < ::Rails::Engine
    isolate_namespace RailsWebCache

    path = Engine.root.join('app', 'assets', 'config')
    config.assets.precompile << "#{path}/rails_web_cache_manifest.js"

    config.generators do |generate|
      # Don't generate assets
      generate.assets false

      # Don't generate helper
      generate.helper false

      # Rspec
      generate.test_framework :rspec
    end
  end
end
