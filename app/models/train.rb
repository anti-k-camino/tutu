class Train < ActiveRecord::Base
  belongs_to :station
  belongs_to :route
  has_many :tickets  
  has_many :carriages, dependent: :destroy
  validates :number, presence: true

  def train_last
    carriages.last
  end

  def counter(type_name)
    carriages.where(type: type_name)
  end
    
end
