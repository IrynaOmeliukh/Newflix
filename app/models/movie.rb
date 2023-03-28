class Movie < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorite

  update_index('movies') { self }
end
