# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    authorize Ticket
    @tickets = policy_scope(Ticket)
    render json: @tickets
  end

  def create
    @ticket = Ticket.new(ticket_params)
      if @ticket.save
        render json: @ticket, status: :created
        TicketMailer.confirm_email(current_user.email, ticket).deliver_now
      else
        render json: @tickets.errors, status: :unprocessable_entity
      end
  end

  def update
    if @ticket.update(ticket_params)
      render json: :show, status: :ok
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def cancel
    render json:Tickets::CancelUnpaidTickets.new.call
  end

  def show
    @ticket = Ticket.find(params[:id])
    authorize @ticket
    render json: @ticket
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    authorize @ticket
    @ticket.destroy

    head :no_content
  end

  private

  def ticket_params
    params.require(:ticket).permit(array: [:price, :types, :movie_id, :screening_id, :seat_id, :user_id])
  end
end
