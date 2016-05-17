class AddStationIdToTrains < ActiveRecord::Migration
  def change
    # add_column :trains, :station_id, :integer
    add_belongs_to :trains, :station
  end
end
