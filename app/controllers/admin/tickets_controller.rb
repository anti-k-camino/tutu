class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, except: [:index]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket]
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :number, :start_station_id, :finish_station_id, :name, :surname, :user_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
