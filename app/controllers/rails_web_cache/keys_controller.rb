# frozen_string_literal: true

module RailsWebCache
  class KeysController < RailsWebCache::ApplicationController
    before_action :set_key, only: %i[show destroy]
    before_action :set_page, only: :index
    before_action :set_per_page, only: :index
    before_action :set_offset, only: :index

    # GET /keys
    def index
      @keys = keys
      @pages = (@keys.size / @per_page.to_f).ceil
      @keys = (@keys[@offset, @per_page] || []).map.with_index do |key, idx|
        format_key(key, idx)
      end
    end

    # GET /keys/:key
    def show
      redirect_to root_path if @key.nil?
      @value = cache.read(@key)
      @entry = cache.entry(@key)
    end

    # DELETE /keys/:key
    def destroy
      redirect_to root_path if @key.nil?
      cache.delete(@key)
      redirect_to root_path
    end

    # DELETE /keys/all/:keys
    def destroy_all
      keys = params[:keys].presence
      redirect_to root_path if keys.nil?
      (keys || []).each do |key|
        cache.delete(key)
      end
      redirect_to root_path
    end

    private

    def cache
      @cache ||= RailsWebCache.cache
    end

    def format_key(key, idx)
      entry = cache.entry(key)
      {
        id: idx,
        key: key,
        value: cache.read(key),
        expires_at: entry&.expires_at,
        size: entry&.size
      }
    end

    def set_key
      @key = params[:key]
    end

    def set_page
      page = (params[:page].presence || 1).to_i
      page = 1 if page.negative? || page > (2**32)
      @page = page
    end

    def set_offset
      @offset = (@page - 1) * @per_page
    end

    def set_per_page
      @per_page = 20
    end

    def keys
      query = params[:query].presence
      if query.present?
        cache.search(query)
      else
        cache.keys
      end
    end
  end
end
