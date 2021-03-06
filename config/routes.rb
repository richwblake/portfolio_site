Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#home'
  get '/about', to: 'static#about'
  get '/resume', to: 'static#resume'
  get '/resume/download', to: 'static#download'

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'

  resources :users
  resources :posts
  resources :comments, only: [:create]
  resources :sessions, only: [:create]
end
