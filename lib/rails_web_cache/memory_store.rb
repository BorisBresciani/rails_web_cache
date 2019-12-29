# frozen_string_literal: true

module RailsWebCache
  class MemoryStore < Base
    def keys
      cache.instance_variable_get(:@data).keys
    end
  end
end
