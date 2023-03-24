class CreateFavoriteMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_movies do |t|

      t.timestamps
    end
  end
end
