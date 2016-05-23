class AddSitonlySeatsToCarriages < ActiveRecord::Migration
  def change
    add_column :carriages, :sitonly_seats, :integer
  end
end
