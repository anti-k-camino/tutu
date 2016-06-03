class ChangeDepartingFormatInStationsRoutes < ActiveRecord::Migration
  def change
    change_column :stations_routes, :departing, :datetime
  end
end
