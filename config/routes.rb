Rails.application.routes.draw do
  # get 'favorites/index'
  resources :favorites, only: [:index, :create, :destroy]

  # get 'user/index'
  # get 'user/show'
  get 'user/search', to: 'users#search'
  devise_for :users
  resources :movies, except: [:show]
  resources :users, only: [:index, :show]
  # post 'user/add_favorite/:id', to: 'users#add_favorite', as: 'add_favorite'
  # delete 'user/remove_favorite/:id', to: 'users#remove_favorite', as: 'remove_favorite'

  get '/movies/:title/:id', to: 'movies#show', as: 'movie_title'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/search', to: 'movies#search'

  root "movies#index"
end
