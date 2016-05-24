class Route < ActiveRecord::Base
  has_many :trains
  has_many :stations_routes, dependent: :destroy
  has_many :stations, through: :stations_routes

  validates :name, presence: true
  validate :set_stations
  scope :stations, -> { order(:stations_routes.number)}
  before_validation :set_name

  private

  def set_name
    self.name = "#{stations.first.name}-#{stations.last.name}"
  end

  def set_stations
    errors.add(:base, "Должно быть минимум две станции") if stations.size < 2
  end
end
