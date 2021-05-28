class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: %i[show edit update destroy]

  def index
    @movies = Movie.all

    render json: MoviesSerializer.render(@movies, root: :movies), status: :ok
  end

  def show
    render json: MovieSerializer.render(@movie), status: :ok
  end

  private

  def set_movie
    @movie = Movie.find_by!(imdb_id: params[:id])
  end
end
