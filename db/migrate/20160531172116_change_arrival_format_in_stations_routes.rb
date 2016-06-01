class ChangeArrivalFormatInStationsRoutes < ActiveRecord::Migration
  def change
    change_column :stations_routes, :arrival, :datetime
  end
end
