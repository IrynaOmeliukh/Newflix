class MovieSearch

  def self.tmbd_search(parameter)
    search_movies = Tmdb::Search.movie(parameter, page: 1).results
    serialized_api_collection = ApiMoviesSerializer.new(search_movies).to_hash
  end

  def self.db_search(parameter)
    MoviesIndex.import!
    search_result = MoviesIndex.query(
      { match: { title: parameter } }
    ).records
  end

  def self.search(parameter)
    # binding.pry
    @movies_results = []
    @tmbd_movies_results = tmbd_search(parameter)
    @db_movies_results = db_search(parameter)
    # binding.pry
    @movies_results.push(@tmbd_movies_results).push(@db_movies_results).flatten
  end
end
