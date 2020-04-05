Rails.application.routes.draw do
  resources :queries do
  	resources :terms
  end
  root 'queries#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
