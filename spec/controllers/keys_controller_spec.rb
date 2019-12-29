# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RailsWebCache::KeysController, type: :controller do
  routes { RailsWebCache::Engine.routes }

  describe 'GET #index' do
    it 'returns a success response' do
      Rails.cache.write('RailsWebCache', 'RailsWebCache')
      get :index
      expect(response).to be_successful
      get :index, params: { query: 'Search' }
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      Rails.cache.write('RailsWebCache', 'RailsWebCache')
      get :show, params: { key: 'RailsWebCache' }
      expect(response).to be_successful
    end
  end

  describe 'GET #destroy' do
    it 'returns a success response' do
      Rails.cache.write('RailsWebCache', 'RailsWebCache')
      get :destroy, params: { key: 'RailsWebCache' }
      expect(response).to be_redirect
    end
  end

  describe 'GET #destroy_all' do
    it 'returns a success response' do
      Rails.cache.write('RailsWebCache', 'RailsWebCache')
      get :destroy_all, params: { keys: ['RailsWebCache'] }
      expect(response).to be_redirect
    end
  end
end
