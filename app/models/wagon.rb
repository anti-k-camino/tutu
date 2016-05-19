class Wagon < ActiveRecord::Base
  belongs_to :train
  validates :types, presence: true
  validates :upper, :lower, inclusion: { in: (0..100)}
  
  def coupe
    'Купе'
  end

  def platzkart
    'Плацкарт'
  end 
end
