# frozen_string_literal: true

require 'rails_web_cache/engine'
require 'rails_web_cache/base'
require 'rails_web_cache/entry'
require 'rails_web_cache/file_store'
require 'rails_web_cache/memory_store'
require 'rails_web_cache/redis_cache_store'

module RailsWebCache
  class << self
    def cache
      @cache ||= driver(Rails.cache)
    end

    private

    def driver(cache)
      if redis_cache_store?(cache)
        RedisCacheStore.new(cache)
      elsif memory_store?(cache)
        MemoryStore.new(cache)
      elsif file_store?(cache)
        FileStore.new(cache)
      else
        raise ArgumentError, "RailsWebCache doesn't support #{cache.class}"
      end
    end

    def redis_cache_store?(driver)
      !!defined?(::Redis) &&
        !!defined?(::ActiveSupport::Cache::RedisCacheStore) &&
        driver.is_a?(::ActiveSupport::Cache::RedisCacheStore)
    end

    def memory_store?(driver)
      !!defined?(::ActiveSupport::Cache::MemoryStore) &&
        driver.is_a?(::ActiveSupport::Cache::MemoryStore)
    end

    def file_store?(driver)
      !!defined?(::ActiveSupport::Cache::FileStore) &&
        driver.is_a?(::ActiveSupport::Cache::FileStore)
    end
  end
end
