class Station < ActiveRecord::Base
  has_many :trains
  has_many :stations_routes
  has_many :routes, through: :stations_routes
  has_many :start_tickets, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :finish_tickets, class_name: 'Ticket', foreign_key: :finish_ticket_id  
  validates :name, presence: true     
end
