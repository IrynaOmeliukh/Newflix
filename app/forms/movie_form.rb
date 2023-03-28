class MovieForm
  attr_reader :movie

  def initialize(movie)
    @movie = movie
  end

  def genres
    # if movie['genres'].present?
    #   return 'no genres'
    # end
    # tmbd_movie_details.genres.map(&:name).join(", ")

    if movie['genres'].present? || movie['genres'].nil?
      return tmbd_movie_details.genres.map(&:name).join(", ")
    end
    'no genres'
    # add checking if in the db genres are setted correctly

  end

  def rating
    if movie['vote_average'].nil?
      movie['vote_average'] = 0
    else
      movie['vote_average'].round(1)
    end
  end

  def casts
    begin
      if Tmdb::Movie.detail(movie['id']).title == movie['title']
        @tmbd_cast = CastsSerializer.new(Tmdb::Movie.cast(movie['id'])).to_hash
      else
        @tmbd_cast = []
      end
    rescue Tmdb::Error => e
      @tmbd_cast = []
    end
  end

  private

  def tmbd_movie_details
    @tmbd_movie_details ||= Tmdb::Movie.detail(movie['id'])
  end

  # def tmbd_cast
  #   @tmbd_cast ||= Tmdb::Movie.cast(movie['id'])
  # end
end
