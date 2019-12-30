# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RailsWebCache::KeysController, type: :routing do
  routes { RailsWebCache::Engine.routes }

  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/').to(
        route_to('rails_web_cache/keys#index')
      )
    end

    it 'routes to #show' do
      expect(get: '/keys').to(
        route_to('rails_web_cache/keys#show')
      )
    end

    it 'routes to #destroy' do
      expect(delete: 'keys').to(
        route_to('rails_web_cache/keys#destroy')
      )
    end

    it 'routes to #destroy_all' do
      expect(delete: 'keys/destroy_all').to(
        route_to('rails_web_cache/keys#destroy_all')
      )
    end
  end
end
