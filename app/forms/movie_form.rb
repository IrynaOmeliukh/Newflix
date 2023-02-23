class MovieForm
  attr_reader :movie

  def initialize(movie)
    @movie = movie
  end

  def genres
    # binding.pry
    if movie['genres'].present?
      return 'no genres'
    end
    tmbd_movie_details.genres.map(&:name).join(", ")
  end

  def rating
    # binding.pry
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

  # def movie_details
  #   @movie_details || =
  # end

end
