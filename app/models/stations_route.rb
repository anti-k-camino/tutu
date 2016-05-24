class StationsRoute < ActiveRecord::Base
  belongs_to :station
  belongs_to :route  

  validates :station_id, uniqueness: { scope: :route_id }
  validates :number, uniqueness:{ scope: :route_id } 
  
  def update_number(num)
    self.number = num
    self.save
  end 
  
end
