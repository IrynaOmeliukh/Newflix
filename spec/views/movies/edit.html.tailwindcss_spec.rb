require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  let(:movie) {
    Movie.create!(
      name: "MyString",
      description: "MyText",
      poster_path: "MyString",
      genres: 1,
      release_date: "MyString",
      popularity: 1.5,
      vote_avg: 1.5,
      vote_count: 1
    )
  }

  before(:each) do
    assign(:movie, movie)
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(movie), "post" do

      assert_select "input[name=?]", "movie[name]"

      assert_select "textarea[name=?]", "movie[description]"

      assert_select "input[name=?]", "movie[poster_path]"

      assert_select "input[name=?]", "movie[genres]"

      assert_select "input[name=?]", "movie[release_date]"

      assert_select "input[name=?]", "movie[popularity]"

      assert_select "input[name=?]", "movie[vote_avg]"

      assert_select "input[name=?]", "movie[vote_count]"
    end
  end
end
