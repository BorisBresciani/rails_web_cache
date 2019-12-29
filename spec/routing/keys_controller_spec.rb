# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RailsWebCache::KeysController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/rails_web_cache/keys').to(
        route_to('rails_web_cache/keys#index')
      )
    end

    it 'routes to #show' do
      expect(get: '/rails_web_cache/keys/1').to(
        route_to('rails_web_cache/keys#show', key: '1')
      )
    end

    it 'routes to #destroy' do
      expect(delete: '/rails_web_cache/keys/1').to(
        route_to('rails_web_cache/keys#destroy', key: '1')
      )
    end

    it 'routes to #destroy_all' do
      expect(delete: '/rails_web_cache/keys/destroy_all').to(
        route_to('rails_web_cache/keys#destroy_all')
      )
    end
  end
end
