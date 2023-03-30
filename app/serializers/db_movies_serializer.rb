class DbMoviesSerializer
  attr_reader :movies

  EXTRACTED_KEYS = ['id', 'title', 'description', 'poster_path', 'genres']

  def initialize(movies)
    @movies = movies
  end

  def to_hash
    @movies_hash ||= [].tap do |arr|

      movies.as_json.map do |movie|
        next if movie['tmdb_id'].present?

        new_movie = movie.slice(*EXTRACTED_KEYS)
        new_movie['details'] = movie.except(*EXTRACTED_KEYS)

        arr << new_movie
      end
    end
  end
end
