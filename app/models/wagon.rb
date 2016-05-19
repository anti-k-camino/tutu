class Wagon < ActiveRecord::Base
  belongs_to :train
  validates :types, presence: true
  validates :upper, :lower, inclusion: { in: (0..100)}
end
