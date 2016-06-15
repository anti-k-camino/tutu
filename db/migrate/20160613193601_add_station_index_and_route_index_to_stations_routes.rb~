class AddStationIndexAndRouteIndexToStationsRoutes < ActiveRecord::Migration
  def change
    add_index :stations_routes, [:station_id, :route_id], unique:true
  end
end
