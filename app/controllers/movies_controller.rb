class MoviesController < ApplicationController
  # GET /movies
  def index
    @tmbd_movies = Tmdb::Movie.popular
    @movies_results = @tmbd_movies.results
    @movie_decorator = MoviesDecorator.new(@movies_results, collection)
    # @movies_results.each do |tmdb|
    #   if !Movie.exists?(name: tmdb.title)
    #     movie = Movie.create(name: tmdb.title, genres: tmdb.genre_ids, tmdb_id: tmdb.id,
    #       description: tmdb.overview, poster_path: tmdb.poster_path,
    #       vote_avg: tmdb.vote_average, vote_count: tmdb.vote_count, popularity:
    #       tmdb.popularity, release_date: tmdb.release_date
    #     )
    #    end
    # end
    # @movies = collection
  end

  def search
    if params[:search].blank?
      redirect_to movies_url and return
    else
      @parameter = params[:search].downcase
      @movie_data = Tmdb::Search.movie(@parameter, page: 1, language: 'en')
      movie_array = @movie_data.results

      @search_movies = []
      movie_array.each do |tmdb|
      #  if !Movie.exists?(title: tmdb.title)
      movie = Movie.create(name: tmdb.title, genres: tmdb.genre_ids, tmdb_id: tmdb.id,
        description: tmdb.overview, poster_path: tmdb.poster_path,
        vote_avg: tmdb.vote_average, vote_count: tmdb.vote_count, popularity:
        tmdb.popularity, release_date: tmdb.release_date
      )
      @search_movies << movie
      #  end
      end

    end
  end

  # GET /movies/1
  def show
    @movie = resource
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
    @movie = resource
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie, notice: "Movie was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    @movie = resource

    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
    redirect_to movies_url, notice: "Movie was successfully destroyed."
  end

  private
    def collection
      Movie.all
    end

    def resource
      collection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:name, :description, :poster_path, :genres, :release_date, :popularity, :vote_avg, :vote_count)
    end
end
