class DbMoviesSerializer
  attr_reader :movies

  EXTRACTED_KEYS = ['id', 'name', 'description', 'poster_path', 'genres']

  def initialize(movies)
    @movies = movies
  end

  def to_hash
    @movies_hash = movies.as_json.map do |movie|
      new_movie = movie.slice(*EXTRACTED_KEYS)
      new_movie['details'] = movie.except(*EXTRACTED_KEYS)
      new_movie
    end
    # binding.pry

    @movies_hash
  end

end
