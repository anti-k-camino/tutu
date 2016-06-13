class Station < ActiveRecord::Base
  has_many :trains
  has_many :stations_routes
  has_many :routes, through: :stations_routes
  has_many :start_tickets, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :finish_tickets, class_name: 'Ticket', foreign_key: :finish_ticket_id
  validates :name, presence: true

  scope :ordered, -> { joins(:stations_routes).order('stations_routes.position').uniq }

  def update_position_schedule(route, position, arrival, departing) # is renamed but left in one
    station_route = station_route(route) # method for the purpose of one query
    if station_route
      station_route.update(position: position, arrival: arrival, departing: departing)
    end
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def schedule_at(route, type)
    station_route(route).try(type)
  end

  protected

  def station_route(route)
    @station_route = stations_routes.where(route: route).first
  end
end
