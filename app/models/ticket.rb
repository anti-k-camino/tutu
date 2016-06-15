class Ticket < ActiveRecord::Base
  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
  belongs_to :finish_station, class_name: 'Station', foreign_key: :finish_station_id

  after_create :send_notification
  after_destroy :send_delition



  validates :number, :start_station, :finish_station, :name, :surname, :user, presence: true



  def departing
    start_station.schedule_at(train.route, :departing)
  end

  def arrival
    finish_station.schedule_at(train.route, :arrival)
  end

  def route_name
    "#{start_station.name} - #{finish_station.name}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_delition
    TicketsMailer.drop_ticket(self.user, self).deliver_now
  end
end
