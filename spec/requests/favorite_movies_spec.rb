require 'rails_helper'

RSpec.describe "FavoriteMovies", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/favorite_movies/index"
      expect(response).to have_http_status(:success)
    end
  end

end
