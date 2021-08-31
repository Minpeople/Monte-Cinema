# frozen_string_literal: true

class TicketDesksController < ApplicationController
  after_action :verify_policy_scoped, only: :index, :show
  skip_after_action :verify_authorized, only: :index, :show

  def index
      @ticket_desks = policy_scope(TicketDesk)
      render json: @ticket_desks
  end

  def create
    authorize TicketDesk
      @ticket_desk = TicketDesk.new(ticket_desk_params)

      if @ticket_desk.save
      render json: @ticket_desk,
              status: :created
      else
      render json: @ticket_desk.errors,
              status: :unprocessable_entity
      end
  end

  def show
    if user_signed_in?
      @ticket_desk = TicketDesk.find(params[:id])
      render json: @ticket_desk
    end
  end

  def update
    ticket_desk = authorize TicketDesk.find(params[:id])
      if @ticket_desk.update(ticket_desk_params)
        render json: :show, 
              status: :ok
      else
        render json: @ticket_desk.errors, 
              status: :unprocessable_entity
      end
    end
  end

  def destroy
    ticket_desk = authorize TicketDesk.find(params[:id])
    ticket_desk.destroy

      head :no_content
    end
  end

  private

    def ticket_desk_params
      params.require(:ticket_desk).permit!
    end
end
    