class AddFieldsToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :showtimes, :text, array: true, default: '[]'
    add_column :movies, :price, :float
  end
end
