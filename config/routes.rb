Rails.application.routes.draw do
  scope '(:locale)' do
    resources :favorites, only: [:index, :create, :destroy]
    get 'favorites/render_pdf', to: 'favorites#render_pdf', as: 'render_pdf'

    devise_for :users

    resources :movies, except: [:show, :destroy]
    get '/movies/:title/:id', to: 'movies#show', as: 'movie_title'
    delete '/movies/:title/:id', to: 'movies#destroy', as: 'movie_delete'
    get '/search', to: 'movies#search'
    get '/top_rated', to: 'movies#top_rated'
    get '/simmilar/:id', to: 'movies#simmilar', as: 'movie_simmilar'


    resources :users, only: [:index, :show]
    get 'user/search', to: 'users#search'
    post 'user/follow', to: 'users#follow', as: 'follow'
    delete 'user/unfollow', to: 'users#unfollow', as: 'unfollow'
    get '/user/followees/:id', to: 'users#followees', as: 'user_followees'
    get '/user/followers/:id', to: 'users#followers', as: 'user_followers'


    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")

    root "movies#index"
  end
end
