class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string  :title, :null => false
      t.integer :year
      t.string  :rated
      t.date    :released
      t.integer :runtime
      t.text    :genres, array: true, default: []
      t.text    :directors, array: true, default: []
      t.text    :writers, array: true, default: []
      t.text    :actors, array: true, default: []
      t.text    :languages, array: true, default: []
      t.text    :countries, array: true, default: []
      t.text    :awards, array: true, default: []
      t.text    :plot
      t.string  :poster
      t.integer :metascore
      t.float   :imdb_rating
      t.integer :imdb_votes
      t.string  :imdb_id
      t.date    :dvd
      t.bigint  :boxoffice
      t.string  :production
      t.string  :website
      t.boolean :response
      t.json    :ratings

      t.timestamps
    end
  end
end
