class Movie < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :imdb_id, presence: true, uniqueness: true
  
  def to_param
    imdb_id
  end
end
