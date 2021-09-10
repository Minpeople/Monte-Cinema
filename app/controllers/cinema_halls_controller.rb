# frozen_string_literal: true

class CinemaHallsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

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
    cinema_hall =  CinemaHalls::UseCases::Find.new.call(id: params[:id])
    render json: CinemaHalls::Representers::Single.new(cinema_hall).call
  end

  def update
    cinema_hall = CinemaHalls::UseCases::Update.new(id: params[:id], params: cinema_hall_params).call
      if cinema_hall.valid?
        render json: :show, 
        status: :ok
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
