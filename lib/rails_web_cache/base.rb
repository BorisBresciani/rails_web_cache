# frozen_string_literal: true

module RailsWebCache
  class Base
    attr_reader :cache

    def initialize(cache)
      @cache = cache
    end

    def keys_size
      keys.size
    end

    def clear
      cache.clear
    end

    def read(key)
      cache.read(key) if key
    end

    def delete(key)
      cache.delete(key) if key
    end

    def entry(key, options = {})
      return nil unless key
      entry = read_entry(key, options)
      return nil unless entry
      RailsWebCache::Entry.new(entry)
    end

    def search(query = '')
      keys.select { |key| key.downcase.include?(query.downcase) } if query
    end

    private

    def read_entry(key, options = {})
      cache.send(:read_entry, key, options)
    end
  end
end
