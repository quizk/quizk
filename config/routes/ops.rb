# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :ops, path: '/' do
    root to: 'home#index'

    resources :operators, only: %i[index show new create edit update]
  end
end
