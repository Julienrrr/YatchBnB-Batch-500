class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :name, :boat_model, :capacity, :description, :price_per_day, :photos, presence: true
  validates :capacity, numericality: true
end
