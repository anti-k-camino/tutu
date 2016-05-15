class Train < ActiveRecord::Base
  validates :number, presence: true
  belongs_to :station
  belongs_to :route
  has_many :tickets
end
