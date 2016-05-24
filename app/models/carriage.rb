class Carriage < ActiveRecord::Base
  belongs_to :train
  before_validation :set_number

  validates :number, presence: true, uniqueness: { scope: :train_id }

  def self.types
    %w(CoupeCarriage, EconomyCarriage, SvCarriage, SitonlyCarriage)
  end
  # scope :CoupeCarriages, -> { where(type: 'CoupeCarriage') }
  # scope :EconomyCarriages, -> { where(type: 'EconomyCarriage') }

  private  

  def set_number
    self.number = (train.train_last)? (train.train_last.number + 1) : 1
  end
end
