class Movie < ApplicationRecord
  update_index('movies') { self }
end
