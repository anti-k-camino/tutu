class SvCarriage < Carriage
  validates :bottom_seats, presence: true, inclusion: { in: (0..100) }
end
