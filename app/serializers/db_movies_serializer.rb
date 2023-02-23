class DbMoviesSerializer
  attr_reader :movies

  EXTRACTED_KEYS = ['id', 'name', 'description', 'poster_path', 'genres']

  def initialize(movies)
    @movies = movies
  end

  def to_hash
    @movies_hash = movies.as_json.map do |movie|
      # binding.pry
      movie.slice(*EXTRACTED_KEYS)
      # movie['details'] = movie.except(*EXTRACTED_KEYS)
    end

    @movies_hash
  end

end
