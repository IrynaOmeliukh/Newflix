class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.string :poster_path
      t.integer :genres, default: [], array: true
      t.string :release_date
      t.float :popularity
      t.float :vote_avg
      t.integer :vote_count

      t.timestamps
    end
  end
end
