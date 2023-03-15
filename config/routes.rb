Rails.application.routes.draw do
  devise_for :users
  resources :movies, except: [:show]

  get '/movies/:title', to: 'movies#show', as: 'movie_title'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/search', to: 'movies#search'

  root "movies#index"
end
