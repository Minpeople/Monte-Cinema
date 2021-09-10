# frozen_string_literal: true

class ScreeningsController < ApplicationController
  include JSONAPI::Fetching

  before_action :authenticate_user!, except: %i[index show]

  def index
    screenings = Screening.all
    render jsonapi: screenings
  end

  def show
    screening = Screening.find(params[:id])
    authorize screening
    render json: screening
  end

  def create
    authorize Screening
    screening = Screening.new(screening_params)
    if screening.save
      render json: screening, status: :created
    else
      render json: screening.errors
    end
  end

  def update
    screening = Screening.find(params[:id])
    authorize screening
    if screening.update(screening_params)
      render json: { success: 'Update successful' }
    else
      render json: screening.errors
    end
  end

  def delete
    screening = Screening.find(params[:id])
    authorize screening
    if screening.destroy
      render json: { success: 'Delete successful' }
    else
      render json: screening.errors
    end
  end

  private

  def screening_params
    params.require(:screening).permit(:date, :cinema_hall_id)
  end
end
