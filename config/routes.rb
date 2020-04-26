# frozen_string_literal: true

Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: %i[new create] do
    resources :queries do
      resources :terms
    end
  end
  root 'sessions#welcome'
  # root 'queries#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
