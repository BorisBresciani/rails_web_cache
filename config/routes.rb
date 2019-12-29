# frozen_string_literal: true

RailsWebCache::Engine.routes.draw do
  resources :keys, only: %i[index show destroy], param: :key do
    collection do
      delete :destroy_all
    end
  end

  root to: 'keys#index'
end
