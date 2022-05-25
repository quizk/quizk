# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :ops, path: '/' do
    root to: 'home#index'

    concern :trashable do
      post :trash, :restore, on: :member
    end

    resources :operators, only: %i[index show new create edit update]
    resources :universities, concerns: :trashable
    resources :categories, :questions
  end
end
