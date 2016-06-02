class Ticket < ActiveRecord::Base
  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
  belongs_to :finish_station, class_name: 'Station', foreign_key: :finish_station_id
  validates :number, :start_station, :finish_station, :name, :surname, :user,  presence: true

  def departing
    start_station.schedule_at(train.route, :departing)    
  end

  def arrival
    finish_station.schedule_at(train.route, :arrival)
  end
  
end
