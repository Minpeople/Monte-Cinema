# frozen_string_literal: true

class CinemaHallsController < ApplicationController
  include JSONAPI::Fetching

  def index
    @cinema_halls = CinemaHall.all
    render jsonapi: @cinema_halls
  end

  def create
    @cinema_hall = CinemaHall.new(cinema_hall_params)

    if @cinema_hall.save
      render jsonapi: @cinema_halls,
             status: :created
    else
      render jsonapi: @cinema_halls.errors,
             status: :unprocessable_entity
    end
  end

  def show
    @cinema_hall = CinemaHall.find(params[:id])
<<<<<<< HEAD
    render jsonapi: @cinema_hall
=======
    render json: @cinema_hall
>>>>>>> 50b4977918c76efb07987f9abe1c7f239ac65c4b
  rescue ActiveRecord::RecordNotFound => e
    render jsonapi: { error: e.message }, status: :not_found
  end

  def update
    if @cinema_hall.update(cinema_hall_params)
      render jsonapi: :show, status: :ok
    else
      render jsonapi: @cinema_hall.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cinema_hall = CinemaHall.find(params[:id])
    @cinema_hall.destroy

    head :no_content
  end

  private

  def cinema_hall_params
    params.require(:cinema_hall).permit(:name, :capacity)
  end
end
