class RenameColumnsInMovies < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :vote_avg, :vote_average
  end
end
