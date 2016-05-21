class Route < ActiveRecord::Base
  has_many :trains
  has_many :stations_routes
  has_many :stations, through: :stations_routes

  validates :name, presence: true
  validate :set_stations

  before_validation :set_name

  private

  def set_name
    self.name = "#{stations.first.name}-#{stations.last.name}"
  end

  def set_stations
    if stations.size < 2
      errors.add(:base, "Должно быть минимум две станции")
    end
  end  
end
