class MoviesSerializer < ApplicationSerializer
  fields :title, :price, :imdb_id

  field :showtimes do |object, _options|
    JSON.parse(object.showtimes)
  end
end
