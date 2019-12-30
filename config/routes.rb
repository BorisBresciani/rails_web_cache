# frozen_string_literal: true

RailsWebCache::Engine.routes.draw do
  get 'keys' => 'keys#show', as: :show_key
  delete 'keys' => 'keys#destroy', as: :destroy_key
  delete 'keys/destroy_all', to: 'keys#destroy_all', as: :destroy_all_keys

  root to: 'keys#index'
end
