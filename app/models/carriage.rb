class Carriage < ActiveRecord::Base
  belongs_to :train 
  before_validation :set_number

  def self.types
      %w(CoupeCarriage, EconomyCarriage)
  end
  #scope :CoupeCarriages, -> { where(type: 'CoupeCarriage') } 
  #scope :EconomyCarriages, -> { where(type: 'EconomyCarriage') } 
  

  private
    def set_number
      self.number = train.trains_size + 1
    end

end
