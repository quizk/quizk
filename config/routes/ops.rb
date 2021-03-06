# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :ops, path: '/' do
    root to: 'home#index'

    concern :trashable do
      post :trash, :restore, on: :member
    end

    resources :operators, only: %i[index show new create edit update]
    resources :users, only: %i[index show]
    resources :universities, concerns: :trashable
    resources :topics
    resources :questions do
      resources :answers
    end
    resources :exams do
      resources :question_sets
    end
  end
end
