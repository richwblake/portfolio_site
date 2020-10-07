Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#home'
  get '/about', to: 'static#about'
  get '/resume', to: 'static#resume'

  resources :users
  resources :sessions, only: [:create]

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
end
