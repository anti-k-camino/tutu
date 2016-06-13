class AddTrainIndexToCarriages < ActiveRecord::Migration
  def change
    add_index :carriages, :train_id
  end
end
