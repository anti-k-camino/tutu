class Route < ActiveRecord::Base
  validates :name, presence: true
  has_many :trains
  has_many :stations_routes
  has_many :stations, through: :stations_routes
end
