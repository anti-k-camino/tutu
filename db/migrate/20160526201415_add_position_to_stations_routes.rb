class AddPositionToStationsRoutes < ActiveRecord::Migration
  def change
    add_column :stations_routes, :position, :integer
  end
end
