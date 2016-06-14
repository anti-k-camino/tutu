class AddIndexToTickets < ActiveRecord::Migration
  def change
    add_index :tickets, :start_station_id
    add_index :tickets, :finish_station_id
  end
end
