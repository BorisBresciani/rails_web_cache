# frozen_string_literal: true

module RailsWebCache
  class Entry
    attr_reader :entry

    def initialize(entry)
      @entry = entry
    end

    def expires_at
      entry.expires_at ? Time.at(entry.expires_at) : nil
    end

    def size
      entry.size
    end
  end
end