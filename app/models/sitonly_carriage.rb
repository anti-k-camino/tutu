class SitonlyCarriage < Carriage
  validates :sitonly_seats, presence: true, inclusion:{ in: (0..100) }
end
