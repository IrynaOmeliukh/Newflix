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

  def hash_for_simmilar

    @movies_hash = movies.as_json.values.first['results'].map do |movie|
    # binding.pry

      new_movie = movie.values.first.slice(*EXTRACTED_KEYS)
      new_movie['details'] = movie.values.first.except(*EXTRACTED_KEYS)
      new_movie
    end
  end

  def self.movie_to_hash(movie)
    # new_movie = movie.first.as_json.values.first.slice(*EXTRACTED_KEYS)
    # new_movie['details'] = movie.first.as_json.values.first.except(*EXTRACTED_KEYS)

    new_movie = movie.as_json.values.first.slice(*EXTRACTED_KEYS)
    new_movie['details'] = movie.as_json.values.first.except(*EXTRACTED_KEYS)
    new_movie
  end
end
