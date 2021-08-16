# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy]
  
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def show
    render json: @reservation
  end

  def create_reservation
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservations.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
  end

  private
  
  def reservation_params
    params.require(:reservation).permit(:status, :user_id, :screening_id)
  end
  
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
