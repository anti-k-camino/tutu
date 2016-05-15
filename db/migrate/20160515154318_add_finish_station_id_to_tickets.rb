class AddFinishStationIdToTickets < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :finish_station
  end
end
