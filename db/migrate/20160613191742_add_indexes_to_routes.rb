class AddIndexesToRoutes < ActiveRecord::Migration
  def change
    add_index :routes, :id
  end
end
