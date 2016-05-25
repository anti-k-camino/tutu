class Train < ActiveRecord::Base
  belongs_to :station
  belongs_to :route
  has_many :tickets
  has_many :carriages, dependent: :destroy
  validates :number, presence: true

  def carriage_order
    head ? carriages.order(:number) : carriages.order('number DESC')
  end

  def tseats(carriage_type, seats_type)
    carriages.where(type: carriage_type).sum(seats_type)
  end

  def train_last
    carriages.last
  end

  def counter(type_name)
    carriages.where(type: type_name)
  end
end
