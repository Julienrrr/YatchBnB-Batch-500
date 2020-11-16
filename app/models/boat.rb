class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :model, :capacity, :description, presence: true
  validates :capacity, numericality: true
end
