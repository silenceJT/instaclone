Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end

  resources :profiles, only: [:index]
  get 'profiles/:username', to: 'profiles#show', as: :profile

  resources :photos, only: [:index, :show, :new, :create, :destroy]

  resources :comments, only: [:create, :edit, :update, :destroy]

  resources :friend_requests, only: [:create, :index] do
    post :accept
    post :decline
  end

  get 'friends/:username', to: 'friends#show', as: :friends

  root 'photos#index'

  get '*path', to: 'photos#index', constraints: lambda { |req| req.path.exclude? 'rails/active_storage' }
end
