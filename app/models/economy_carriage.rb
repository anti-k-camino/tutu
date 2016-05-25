class EconomyCarriage < Carriage
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, presence: true, inclusion: { in: (0..100) }
end
