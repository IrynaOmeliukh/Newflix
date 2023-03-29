class DbMoviesSerializer
  attr_reader :movies

  EXTRACTED_KEYS = ['id', 'title', 'description', 'poster_path', 'genres']

  def initialize(movies)
    @movies = movies
  end

  def to_hash
    @movies_hash = []

     movies.as_json.map do |movie|
      if movie['tmdb_id'].present?
        break
      else
        new_movie = movie.slice(*EXTRACTED_KEYS)
        new_movie['details'] = movie.except(*EXTRACTED_KEYS)
        @movies_hash << new_movie
      end
    end
    @movies_hash
  end
end
