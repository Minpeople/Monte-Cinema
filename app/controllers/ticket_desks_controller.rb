# frozen_string_literal: true

class TicketDesksController < ApplicationController
  before_action :only => [:index, :show] do
    redirect_to new_user_session_path unless current_user && current_user.role('admin)')
  end

  def index
    @ticket_desks = TicketDesk.all
    render json: @ticket_desks
  end

  def create
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
    @ticket_desk = TicketDesk.find(params[:id])
    render json: @ticket_desk
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, 
          status: :not_found
  end

  def update
    if @ticket_desk.update(ticket_desk_params)
    render json: :show, 
          status: :ok
    else
    render json: @ticket_desk.errors, 
          status: :unprocessable_entity
    end
  end

  def destroy
    @ticket_desk = TicketDesk.find(params[:id])
    @ticket_desk.destroy

    head :no_content
  end


  private

    def ticket_desk_params
      params.require(:ticket_desk).permit!
    end
end
    