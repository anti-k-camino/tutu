class Wagon < ActiveRecord::Base
  belongs_to :train
  validates :types, presence: true
end