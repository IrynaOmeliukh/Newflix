require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(
        title: "Name",
        description: "MyText",
        poster_path: "Poster Path",
        genres: 2,
        release_date: "Release Date",
        popularity: 3.5,
        vote_average: 4.5,
        vote_count: 5
      ),
      Movie.create!(
        title: "Name",
        description: "MyText",
        poster_path: "Poster Path",
        genres: 2,
        release_date: "Release Date",
        popularity: 3.5,
        vote_average: 4.5,
        vote_count: 5
      )
    ])
  end

  it "renders a list of movies" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Poster Path".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Release Date".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(5.to_s), count: 2
  end
end
