class Movie < ApplicationRecord
  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user

  update_index('movies') { self }
end
