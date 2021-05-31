class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: %i[show update destroy review]

  def index
    @movies = Movie.all

    render json: MoviesSerializer.render(@movies, root: :movies), status: :ok
  end

  def show
    render json: MovieSerializer.render(@movie, root: :movie), status: :ok
  end

  def update
    authorize @movie

    if @movie.update(movie_params)
      render json: MovieSerializer.render(@movie, root: :movie)
    else
      render json: { errors: @movie.errors.full_details }, status: :unprocessable_entity
    end
  end

  def destroy
    if @movie.destroy
      render head: :no_content
    else
      render json: { errors: @movie.errors.full_details }, status: :unprocessable_entity
    end
  end

  def review
    @movie.reviews.create(
      user_id: current_user.id,
      score: params[:score],
      feedback: params[:feedback]
    )
    render json: MovieSerializer.render(@movie, root: :movie), status: :ok
  end

  private

  def set_movie
    @movie = Movie.find_by!(imdb_id: params[:id])
  end

  def movie_params
    params.require(:movie).permit(:showtimes, :price)
  end
end
