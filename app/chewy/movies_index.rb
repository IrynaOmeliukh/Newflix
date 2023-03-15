class MoviesIndex < Chewy::Index
  index_scope Movie

  settings analysis: {
    analyzer: {
      email: {
        tokenizer: 'keyword',
        filter: ['lowercase']
      }
    }
  }

  field :title
  field :description
end
