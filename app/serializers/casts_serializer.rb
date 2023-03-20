class CastsSerializer
  attr_reader :casts

  EXTRACTED_KEYS = ['id', 'name', 'profile_path', 'character']

  def initialize(casts)
    @casts = casts
  end

  def to_hash
    @casts_hash = casts.as_json.map do |cast|
      new_cast = cast.values.first.slice(*EXTRACTED_KEYS)
      new_cast['details'] = cast.values.first.except(*EXTRACTED_KEYS)
      new_cast
    end
    # binding.pry

    @casts_hash
  end

  # def self.movie_to_hash(movie)
  #   # new_movie = movie.first.as_json.values.first.slice(*EXTRACTED_KEYS)
  #   # new_movie['details'] = movie.first.as_json.values.first.except(*EXTRACTED_KEYS)

  #   new_movie = movie.as_json.values.first.slice(*EXTRACTED_KEYS)
  #   new_movie['details'] = movie.as_json.values.first.except(*EXTRACTED_KEYS)
  #   new_movie
  # end
end
