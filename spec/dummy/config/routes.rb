# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsWebCache::Engine => '/rails_web_cache'
end
