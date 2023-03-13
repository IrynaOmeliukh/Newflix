require 'rails_helper'

RSpec.describe "MoviesSearch" do
  let(:parameter) { 'iron' }

  it 'is succsessful' do
    # binding.pry
    expect(MovieSearch.search(parameter)).to include({'details': {'title'=>'Iron Man 2'}})
  end
end
