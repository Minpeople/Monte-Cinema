# frozen_string_literal: true

class CinemaHallsController < ApplicationController
  include JSONAPI::Fetching

  def index
    cinema_halls = CinemaHall.all
    render json: CinemaHalls::Representers::Multiple.new(cinema_halls).call
  end

  def create
    cinema_hall = CinemaHalls::UseCases::Create.new(params: cinema_hall_params).call

    if cinema_hall.valid?
      render json: cinema_halls,
             status: :created
    else
      render json: cinema_halls.errors,
             status: :unprocessable_entity
    end
  end

  def show
    cinema_hall = CinemaHalls::Representers::Single.new(cinema_hall).call
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  def update
    cinema_hall = CinemaHalls::UseCases::Update.new(id: params[:id], params: cinema_hall_params).call
      render json: :show, status: :ok
    else
      render json: cinema_hall.errors, status: :unprocessable_entity
    end
  end

  def destroy
    CinemaHalls::UseCases::Delete.new(id: params[:id]).call

    head :no_content
  end

  private

  def cinema_hall_params
    params.require(:cinema_hall).permit(:name, :capacity)
  end
end
