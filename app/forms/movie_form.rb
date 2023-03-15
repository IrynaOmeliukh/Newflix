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

    if movie['genres'].nil?
      return tmbd_movie_details.genres.map(&:name).join(", ")
    end
    'no genres'
    # add checking if in the db genres are setted correctly

  end

  def rating
    if movie['vote_average'].nil?
      movie['vote_average'] = 0
    else
      movie['vote_average'].round(2)
    end
  end

  private

  def tmbd_movie_details
    @tmbd_movie_details ||= Tmdb::Movie.detail(movie['id'])
  end
end
