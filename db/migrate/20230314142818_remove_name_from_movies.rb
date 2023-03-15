class RemoveNameFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :name
  end
end
