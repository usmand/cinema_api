class MovieSerializer < ApplicationSerializer
  fields :title, :year, :rated, :released, :runtime, :plot, :poster, :metascore, :price,
         :imdb_rating, :imdb_votes, :dvd, :boxoffice, :production, :website, :response, :ratings

  field :genres do |object, _options|
    JSON.parse(object.genres)
  end

  field :directors do |object, _options|
    JSON.parse(object.directors)
  end

  field :writers do |object, _options|
    JSON.parse(object.writers)
  end

  field :actors do |object, _options|
    JSON.parse(object.actors)
  end

  field :languages do |object, _options|
    JSON.parse(object.languages)
  end

  field :countries do |object, _options|
    JSON.parse(object.countries)
  end

  field :awards do |object, _options|
    JSON.parse(object.awards)
  end

  field :showtimes do |object, _options|
    JSON.parse(object.showtimes)
  end
end
