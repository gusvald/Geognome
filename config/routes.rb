Rails.application.routes.draw do
  get 'sessions/new'
  root to: 'static#index'

  get '/gnomesss', to: 'static#gnomesss'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  get '/gnomes/:id/like', to: 'gnomes#like'
  get '/gnomes/:id/unlike', to: 'gnomes#unlike'


  resources :likes do
    resources :gnomes
    resources :profiles
  end
  resources :gnomes
  resources :profiles
  resources :routes
  resources :roles
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
