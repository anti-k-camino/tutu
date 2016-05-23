class StationsRoute < ActiveRecord::Base
  belongs_to :station
  belongs_to :route

  before_create :add_number  

  validates :station_id, uniqueness: { scope: :route_id }  

  default_scope {order(:number)}


  private
  def add_number      
    if self.class.last
      self.number = self.class.last.number + 1      
    end   
  end
end
