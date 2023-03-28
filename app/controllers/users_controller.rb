class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @favorite_movies = @user.favorites
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

  # def add_favorite
  #   id = params[:id]

  #   if Movie.find_by(id: id).present?
  #     @movie = Movie.find_by(id: id)
  #   else
  #     @movie = ApiMoviesSerializer.movie_to_hash(Tmdb::Movie.detail(id))
  #   end
  #   @user = current_user

  #   if @user.favorites.map { |t|  t['movie_id'] ==  @movie['id'] }.include?(true)
  #     redirect_back fallback_location: root_path
  #   else
  #     @user.favorites.create!(movie_id: @movie['id'])
  #     redirect_to @user
  #   end
  #   # binding.pry
  # end

  # def remove_favorite
  #   @user = User.find(params[:id])
  #   @movie = Movie.find(params[:movie_id])
  #   @user.movies.destroy(@movie) if @user.movies.include?(@movie)
  #   redirect_to @user
  # end
end
