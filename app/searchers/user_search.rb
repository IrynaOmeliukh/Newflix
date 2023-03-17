class UserSearch

  def self.search(parameter)
    search_result = UsersIndex.query(
      match: { nickname: parameter }
    ).records
  end
end
