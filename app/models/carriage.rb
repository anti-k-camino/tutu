class Carriage < ActiveRecord::Base
  belongs_to :train

  validates :number, presence: true, uniqueness: { scope: :train_id }  

  scope :coupe_carriages, -> { where(type: 'CoupeCarriage') }
  scope :economy_carriages, -> { where(type: 'EconomyCarriage') }
  scope :sv_carriages, -> { where(type: 'SvCarriage') }
  scope :sitonly_carriages, -> { where(type: 'SitonlyCarriage') }  
end
