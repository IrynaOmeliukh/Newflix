require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  let(:movie) {
    Movie.create!(
      title: "MyString",
      description: "MyText",
      poster_path: "MyString",
      genres: 1,
      release_date: "MyString",
      popularity: 1.5,
      vote_average: 1.5,
      vote_count: 1
    )
  }

  before(:each) do
    assign(:movie, movie)
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(movie), "post" do

      assert_select "input[title=?]", "movie[title]"

      assert_select "textarea[title=?]", "movie[description]"

      assert_select "input[title=?]", "movie[poster_path]"

      assert_select "input[title=?]", "movie[genres]"

      assert_select "input[title=?]", "movie[release_date]"

      assert_select "input[title=?]", "movie[popularity]"

      assert_select "input[title=?]", "movie[vote_average]"

      assert_select "input[title=?]", "movie[vote_count]"
    end
  end
end
