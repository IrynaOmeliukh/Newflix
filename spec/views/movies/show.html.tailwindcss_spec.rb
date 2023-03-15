require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  before(:each) do
    assign(:movie, Movie.create!(
      title: "Name",
      description: "MyText",
      poster_path: "Poster Path",
      genres: 2,
      release_date: "Release Date",
      popularity: 3.5,
      vote_average: 4.5,
      vote_count: 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Poster Path/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Release Date/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5/)
  end
end
