class Carriage < ActiveRecord::Base
  belongs_to :train

  validates :number, presence: true, uniqueness: { scope: :train_id }

  before_validation :set_number
  
  scope :coupe_carriages, -> { where(type: 'CoupeCarriage') }
  scope :economy_carriages, -> { where(type: 'EconomyCarriage') }
  scope :sv_carriages, -> { where(type: 'SvCarriage') }
  scope :sitonly_carriages, -> { where(type: 'SitonlyCarriage') }

  private  

  def set_number
    self.number = (train.train_last)? (train.train_last.number + 1) : 1
  end
end
