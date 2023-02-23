class MoviesDecorator
  attr_reader :api_collection, :db_collection

  def initialize(api_collection, db_collection)
    @api_collection = api_collection
    @db_collection = db_collection
  end

  def collection
    @collection ||= begin
      @serialized_api_collection = ApiMoviesSerializer.new(api_collection).to_hash
      @serialized_db_collection = DbMoviesSerializer.new(db_collection).to_hash

      @serialized_api_collection.push(@serialized_db_collection).flatten
    end
    # binding.pry

  end
end
