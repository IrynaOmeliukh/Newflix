class FavoritesController < ApplicationController
  def index
    @favorites = get_favorites
  end

  # def show
  #   @favorites = get_favorites

  # end

  def render_pdf
    @user = current_user
    @favorites = get_favorites
# binding.pry
    render pdf: "file_name", formats: [:html], stylesheets: ["application"],
           layout: '_pdf'


    FavoriteMailer.new_favorite(@favorites, @user).deliver_now
  end

  def create
    # @movie = Movie.find(params[:movie_id])

    id = params[:id]

    if Movie.find_by(id: id).present?
      @movie = Movie.find_by(id: id)
    else
      tmdb = Tmdb::Movie.detail(id)
      @movie =
      Movie.create(title: tmdb.title, tmdb_id: tmdb.id,
        description: tmdb.overview, poster_path: tmdb.poster_path,
        vote_average: tmdb.vote_average, vote_count: tmdb.vote_count, popularity:
        tmdb.popularity, release_date: tmdb.release_date
      )
    end
    current_user.movies << @movie
    redirect_back fallback_location: root_path

    #   if @user.favorites.map { |t|  t['movie_id'] ==  @movie['id'] }.include?(true)
    #     redirect_back fallback_location: root_path
    #   else
    #     @user.favorites.create!(movie_id: @movie['id'])
    #     redirect_to @user
    #   end
    #   # binding.pry
  end

  def destroy
    # binding.pry
    @movie = Movie.find(params[:id])
    current_user.movies.delete(@movie)
    redirect_back fallback_location: root_path
  end

  def get_favorites
    favorites = []
    current_user.movies.map do |favorite_movie|
      movie = Tmdb::Movie.detail(favorite_movie.tmdb_id)
      favorites << movie
    end
    @favorites_hash = ApiMoviesSerializer.new(favorites).to_hash #.find_by(movie_id: @movie['id'])
  end
end
