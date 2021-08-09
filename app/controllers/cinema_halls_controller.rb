# frozen_string_literal: true

class CinemaHallsController < ApplicationController
	def index 
		@cinema_halls = CinemaHall.all
		render json: @cinema_halls
	end

	def create
		@cinema_hall = CinemaHall.new(cinema_hall_params)

		if @cinema_hall.save
			render json: @cinema_hall,
				status: :created
		else
			render json: @cinema_halls.errors,
				status: :unprocessable_entity
		end
	end

	def show 
		@cinema_hall = CinemaHall.find(params[:id])
		render json: @cinema_hall
	rescue ActiveRecord::RecordNotFound => exception
		render json: {error: exception.message}, status: :not_found 
	end

	def update
		if @cinema_hall.update(cinema_hall_params)
			render json: :show, status: :ok 
		else
			render json: @cinema_hall.errors, status: :unprocessable_entity 
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
