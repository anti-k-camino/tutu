class TicketsController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_ticket, only: [:show, :destroy]

  def index
    @tickets = current_user.tickets
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :number, :start_station_id, :finish_station_id, :name, :surname, :user_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
