class Movie < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :imdb_id, presence: true, uniqueness: true

  has_many :reviews

  def to_param
    imdb_id
  end
end
