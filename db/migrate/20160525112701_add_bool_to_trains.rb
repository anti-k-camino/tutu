class AddBoolToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :head, :boolean, default: true
  end
end
