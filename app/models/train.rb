class Train < ActiveRecord::Base
  belongs_to :station
  belongs_to :route
  has_many :tickets
  validates :number, presence: true
end
