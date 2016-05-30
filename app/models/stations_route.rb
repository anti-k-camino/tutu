class StationsRoute < ActiveRecord::Base
  validates :station_id, uniqueness: { scope: :route_id }
  #validates :position, uniqueness: { scope: :route_id }
  #after_update :set_schedule
  belongs_to :station
  belongs_to :route 


  private
    
  def set_schedule
    errors.add(:base, "Время в формате 'hh:mm:ss' или 'hh:mm' ")unless self.arrival.class == Time   
  end   
end
