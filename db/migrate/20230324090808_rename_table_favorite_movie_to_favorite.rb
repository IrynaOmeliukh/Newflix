class RenameTableFavoriteMovieToFavorite < ActiveRecord::Migration[7.0]
  def change
    rename_table :favorite_movies, :favorites
  end
end
