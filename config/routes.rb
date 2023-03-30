Rails.application.routes.draw do
  resources :favorites, only: [:index, :create, :destroy]
  get 'favorites/render_pdf', to: 'favorites#render_pdf', as: 'render_pdf'


  get 'user/search', to: 'users#search'
  devise_for :users
  resources :movies, except: [:show]
  resources :users, only: [:index, :show]
  post 'user/follow', to: 'users#follow', as: 'follow'
  delete 'user/unfollow', to: 'users#unfollow', as: 'unfollow'
  get '/user/followees/:id', to: 'users#followees', as: 'user_followees'
  get '/user/followers/:id', to: 'users#followers', as: 'user_followers'


  get '/movies/:title/:id', to: 'movies#show', as: 'movie_title'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/search', to: 'movies#search'

  root "movies#index"
end
