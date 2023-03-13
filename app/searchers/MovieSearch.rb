class MovieSearch

  def self.search(parameter)


    # binding.pry
    serialized_api_collection = ApiMoviesSerializer.new(search_movies).to_hash
      # movies_results = search_movies

  end

  def tmbd_search(parameter)
    search_movies = Tmdb::Search.movie(parameter, page: 1).results
    serialized_api_collection = ApiMoviesSerializer.new(search_movies).to_hash
  end

  def db_search(parameter)

  end
end
