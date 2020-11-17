class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :boat_model, :capacity, :description, :price_per_day, presence: true
  validates :capacity, numericality: true
end
