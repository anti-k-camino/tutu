class CoupeCarriage < Carriage
  validates :top_seats, presence: true, inclusion:{ in: (0..100) }
  validates :bottom_seats, presence: true, inclusion:{ in: (0..100) }
end
