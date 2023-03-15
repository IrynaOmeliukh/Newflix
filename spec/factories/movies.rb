FactoryBot.define do
  factory :movie do
    title { "MyString" }
    description { "MyText" }
    poster_path { "MyString" }
    genres { 1 }
    release_date { "MyString" }
    popularity { 1.5 }
    vote_average { 1.5 }
    vote_count { 1 }
  end
end
