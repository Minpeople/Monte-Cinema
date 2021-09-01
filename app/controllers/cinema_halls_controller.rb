# frozen_string_literal: true

class CinemaHallsController < ApplicationController
  include JSONAPI::Fetching

  def index
    @cinema_halls = CinemaHalls::Representers::Multiple.new.call
    render jsonapi: @cinema_halls
  end

  def create
    @cinema_hall = CinemaHalls::UseCases::Create.new(params: cinema_hall_params).call

    if @cinema_hall.save
      render jsonapi: @cinema_halls,
             status: :created
    else
      render jsonapi: @cinema_halls.errors,
             status: :unprocessable_entity
    end
  end

  def show
    @cinema_hall = CinemaHalls::Representers::Single.new(id: params[:id]).call
    render jsonapi: @cinema_hall
  rescue ActiveRecord::RecordNotFound => e
    render jsonapi: { error: e.message }, status: :not_found
  end

  def update
    @cinema_hall = CinemaHalls::UseCases::Update.new(id: params[:id], params: cinema_hall_params).call
    if @cinema_hall.update(cinema_hall_params)
      render jsonapi: :show, status: :ok
    else
      render jsonapi: @cinema_hall.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cinema_hall = CinemaHalls::UseCases::Delete.new(id: params[:id]).call
    @cinema_hall.destroy

    head :no_content
  end

  private

  def cinema_hall_params
    params.require(:cinema_hall).permit(:name, :capacity)
  end
end
