class AddDepartingToStationsRoutes < ActiveRecord::Migration
  def change
    add_column :stations_routes, :departing, :timestamptz
  end
end
