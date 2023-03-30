class UsersController < ApplicationController
  include UserHelper

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # binding.pry
    @favorite_movies = get_favorite_movies_for_certain_user
  end

  def search
    if params[:search].blank?
      redirect_to users_url and return
    else
      @parameter = params[:search].downcase
      @search_users = UserSearch.search(@parameter)
    end
    @search_users
  end

  def follow
    @user = User.find(params[:id])

    Relationship.create_or_find_by(follower_id: current_user.id, followee_id: @user.id)

    respond_to do |format|
      format.turbo_stream do
        # john doe with a user id of 2
        # dom_id_for_follower(@user) -> user_2
        render turbo_stream: [
          turbo_stream.replace(dom_id(@user, :button),
                               partial: 'devise/follow_button',
                               locals: { user: @user }),
          turbo_stream.update(dom_id(@user, :followers_count),
                              partial: 'devise/follower_count',
                              locals: { user: @user })
        ]
      end
    end
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.where(follower_id: current_user.id, followee_id: @user.id).destroy_all

    respond_to do |format|
      format.turbo_stream do
        # john doe with a user id of 2
        # dom_id_for_follower(@user) -> user_2
        render turbo_stream: [
          turbo_stream.replace(dom_id(@user, :button),
                               partial: 'devise/follow_button',
                               locals: { user: @user }),
          turbo_stream.update(dom_id(@user, :followers_count),
                              partial: 'devise/follower_count',
                              locals: { user: @user })
        ]
      end
    end
  end

  def followees
    @user = User.find(params[:id])

    @followees = @user.followees
  end

  def followers
    @user = User.find(params[:id])

    @followers = @user.followers
  end

  private

  def get_favorite_movies_for_certain_user
    favorites = []
    @user = User.find(params[:id])
    @user.movies.map do |favorite_movie|
      movie = Tmdb::Movie.detail(favorite_movie.tmdb_id)
      favorites << movie
    end
    @favorites_hash = ApiMoviesSerializer.new(favorites).to_hash #.find_by(movie_id: @movie['id'])
  end

  def set_user
    @user = User.find(params[:id])

  end
end
