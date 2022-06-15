Rails.application.routes.draw do
  resources :gnomes_profiles
  get '/api' => redirect('/swagggger/dist/index.html?url=/api-docs.json')
  get 'sessions/new'
  root to: 'static#index'
  
  get '/cluster.js', to: 'static#cluster'
  get '/map.css', to: 'static#map'
  get '/marker.js', to: 'static#marker'
  get '/style.css', to: 'static#style'
  get '/geo.js', to: 'static#geo'
  get '/gnomesss', to: 'static#gnomesss'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  get '/gnomes/:id/like', to: 'gnomes_profiles#new'
  get '/gnomes/:id/unlike', to: 'gnomes_profiles#unlike'


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
