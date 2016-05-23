class Train < ActiveRecord::Base
  belongs_to :station
  belongs_to :route
  has_many :tickets
  has_many :wagons
  has_many :carriages
  validates :number, presence: true

  def trains_size
    carriages.count
  end

  def count(arr, meth)
    arr.inject(0) { |acc, iter| acc += iter.send meth.to_sym }
  end  
end
