# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: movies
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
  end

  def create
    movie = Movie.new(movie_params)

    if movie.save
      render json: movie,
             status: :created
    else
      render json: movie.errors,
             status: :unprocessable_entity
    end
  end

  def update
    movie = Movie.find(params[:id])
    if movie.update(movie_params)
      render json: :show, status: :ok
    else
      render json: movie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy

    head :no_content
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :duration)
  end
end
