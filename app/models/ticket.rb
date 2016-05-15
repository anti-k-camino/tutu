class Ticket < ActiveRecord::Base
  validates :number, presence: true
  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name:'Station', foreign_key: :start_station_id
  belongs_to :finish_station, class_name: 'Station', foreign_key: :finish_station_id
end