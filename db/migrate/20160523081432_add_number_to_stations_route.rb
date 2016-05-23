class AddNumberToStationsRoute < ActiveRecord::Migration
  def change
    add_column :stations_routes, :number, :integer, :default => 0
  end
end
