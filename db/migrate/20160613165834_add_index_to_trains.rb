class AddIndexToTrains < ActiveRecord::Migration
  def change
    add_index :trains, :station_id
  end
end
