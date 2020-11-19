class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, presence: true
  validates :rating, numericality: true, inclusion: { in: (1..5).to_a }
end
