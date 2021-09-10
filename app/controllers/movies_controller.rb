# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  
  def index
    movies = Movie.all
    render json: Movies::Representers::Multiple.new(movies).call
  end

  def show
    movie = Movies::UseCases::Find.new(id: params[:id]).call
    render json: Movies::Representers::Single.new(movie).call
  end

  def create
    movie = Movies::UseCases::Create.new(params: movie_params).call

    if movie.valid?
      render json: movie,
             status: :created
    else
      render json: movie.errors,
             status: :unprocessable_entity
    end
  end

  def update
    movie = Movies::UseCases::Update.new(id: params[:id], params: movie_params).call
    if movie.valid?
      render json: :show, 
      status: :ok
    else
      render json: movie.errors, 
      status: :unprocessable_entity
    end
  end

  def destroy
    Movies::UseCases::Delete.new(id: params[:id]).call

    head :no_content
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :duration)
  end
end
