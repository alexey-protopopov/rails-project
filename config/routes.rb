Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'posts#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'
  get 'profile/:username' => 'pages#profile', as: 'profile'
  
  get '/404', to: 'errors#not_found'

  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  resources :users, except: [:new]

  resources :posts do
  	resources :comments
  end
end
