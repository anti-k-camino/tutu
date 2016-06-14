class AddArrivalToStationsRoutes < ActiveRecord::Migration
  def change
    add_column :stations_routes, :arrival, :timestamptz
  end
end
