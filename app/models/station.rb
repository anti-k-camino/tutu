class Station < ActiveRecord::Base
  validates :name, presence: true  
  has_many :trains
  has_many :stations_routes
  has_many :routes, through: :stations_routes
  has_many :start_tickets, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :finish_tickets, class_name: 'Ticket', foreign_key: :finish_ticket_id
  
  scope :ordered, -> { joins(:stations_routes).order("stations_routes.position").uniq } 

  def update_position(route, position, arrival, departing)  
    station_route = station_route(route) 
    if station_route
      station_route.update(position: position)
      station_route.update(arrival: arrival)
      station_route.update(departing: departing)      
    end    
  end

  def position_in(route)    
    station_route(route).try(:position)
  end

  def schedule_at(route, type) 

   puts station_route(route).try(type) 
   station_route(route).try(type)

   #puts"Trolrorlol lolo lolo #{a.to_s} YYYYYHHHAAAAA"   
   #a.to_s(:datetime) if a
  end
  
  

  protected
  def station_route(route)
    @station_route ||= stations_routes.where(route: route).first
  end
end
