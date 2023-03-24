Rails.application.routes.draw do
  get 'favorite_movies/index'
  # get 'user/index'
  # get 'user/show'
  get 'user/search', to: 'users#search'
  devise_for :users
  resources :movies, except: [:show]
  resources :users, only: [:index, :show]

  get '/movies/:title/:id', to: 'movies#show', as: 'movie_title'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/search', to: 'movies#search'

  root "movies#index"
end
