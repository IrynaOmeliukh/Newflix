class UsersIndex < Chewy::Index
  index_scope User

  settings analysis: {
    analyzer: {
      email: {
        tokenizer: 'keyword',
        filter: ['lowercase']
      }
    }
  }

  field :nickname
  field :email, analyzer: 'email'
end
