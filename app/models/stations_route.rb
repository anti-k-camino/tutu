class StationsRoute < ActiveRecord::Base
  belongs_to :station
  belongs_to :route
  validates :station_id, uniqueness: { scope: :route_id }
  validate :check_schedule, on: :update_station_attributes # НЕ РАБОТАЕТ НА UPDATE, на CREATE таки да работает

  private

  def check_schedule
    unless arrival.class == ActiveSupport::TimeWithZone && departing.class == ActiveSupport::TimeWithZone
      route.errors[:base] << 'Неверный формат времени!'
    end
  end
end
