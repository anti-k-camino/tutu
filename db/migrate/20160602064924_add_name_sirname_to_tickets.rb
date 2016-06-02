class AddNameSirnameToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :name, :string
    add_column :tickets, :surname, :string
  end
end
