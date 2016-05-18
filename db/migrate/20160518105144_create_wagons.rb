class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.string :types
      t.integer :upper
      t.integer :lower
      t.timestamps
    end
  end
end
