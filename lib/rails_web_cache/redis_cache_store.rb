# frozen_string_literal: true

module RailsWebCache
  class RedisCacheStore < Base
    def keys_size
      redis.dbsize
    end

    def keys
      redis.keys
    end

    def search(query = '')
      redis.scan_each(match: "*#{query.downcase}*").to_a if query
    end

    private

    def redis
      @redis ||= cache.redis
    end
  end
end
