class ApiMoviesSerializer
  attr_reader :movies

  EXTRACTED_KEYS = ['id', 'title', 'overview', 'poster_path', 'vote_average',
    'vote_count', 'popularity', 'release_date' ]

  def initialize(movies)
    @movies = movies
  end

  def to_hash
    @movies_hash = movies.as_json.map do |movie|
      new_movie = movie.values.first.slice(*EXTRACTED_KEYS)
      new_movie['details'] = movie.values.first.except(*EXTRACTED_KEYS)
      new_movie
    end
    # binding.pry

    @movies_hash
  end
end
