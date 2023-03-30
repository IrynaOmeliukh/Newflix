class Movie < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorite

  validates :title, presence: :true

  update_index('movies') { self }
end
