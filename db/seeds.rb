# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create movies
movie_ids = %w(tt0232500 tt0322259 tt0463985 tt1013752 tt1596343 tt1905041 tt2820852 tt4630562)
movie_ids.each do |id|
  res = OmdbApi.fetch_movie(id)
  movie = Movie.find_or_initialize_by(title: res['Title'], imdb_id: res['imdbID'])
  movie.update(
    year:        res['Year'],
    rated:       res['Rated'],
    released:    res['Released'],
    runtime:     res['Runtime'].gsub(/[^\d]/, ''),
    genres:      res['Genre'].split(', '),
    directors:   res['Director'].split(', '),
    writers:     res['Writer'].split(', '),
    actors:      res['Actors'].split(', '),
    plot:        res['Plot'],
    languages:   res['Language'].split(', '),
    countries:   res['Country'].split(', '),
    awards:      res['Awards'].split(', '),
    poster:      res['Poster'],
    ratings:     res['Ratings'],
    metascore:   res['Metascore'],
    imdb_rating: res['imdbRating'],
    imdb_votes:  res['imdbVotes'].gsub(/[^\d]/, ''),
    dvd:         res['DVD'],
    boxoffice:   res['BoxOffice'].gsub(/[^\d]/, ''),
    production:  res['Production'],
    website:     res['Website'],
    response:    res['Response'] == 'True' ? true : false
  )
  puts "Movie '#{movie.title}' created."
end

# Create owner
User.create(
  name: 'Owner',
  email: 'owner@example.com',
  role: 'owner',
  password: 'password'
)

# Create customers
User.create(
  name: 'Customer 1',
  email: 'customer1@example.com',
  role: 'customer',
  password: 'password'
)
User.create(
  name: 'Customer 2',
  email: 'customer2@example.com',
  role: 'customer',
  password: 'password'
)