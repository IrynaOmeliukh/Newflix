class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # binding.pry
    @favorite_movies = get_favorite_users
  end

  def search
    if params[:search].blank?
      redirect_to users_url and return
    else
      @parameter = params[:search].downcase
      @search_users = UserSearch.search(@parameter)
    end
    @search_users
  end

  def get_favorite_users
    favorites = []
    @user = User.find(params[:id])
    @user.movies.map do |favorite_movie|
      movie = Tmdb::Movie.detail(favorite_movie.tmdb_id)
      favorites << movie
    end
    @favorites_hash = ApiMoviesSerializer.new(favorites).to_hash #.find_by(movie_id: @movie['id'])
  end

end
