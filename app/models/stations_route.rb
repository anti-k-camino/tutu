class StationsRoute < ActiveRecord::Base  
  belongs_to :station
  belongs_to :route
  validate :check_schedule, on: :update

  validates :station_id, uniqueness: { scope: :route_id }
  
  def check_schedule
    unless self.arrival.class == ActiveSupport::TimeWithZone      
      route.errors[:base] << 'Неверный формат времени!'
    end
  end

  private

  def set_schedule
    errors.add(:base, "Время в формате 'hh:mm:ss' или 'hh:mm' ") unless arrival.class == Time
  end
end
