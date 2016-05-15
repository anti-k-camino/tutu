class AddStartStationIdToTickets < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :start_station
  end
end
