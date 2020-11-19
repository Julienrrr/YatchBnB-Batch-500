class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many_attached :photos

  validates :name, :boat_model, :capacity, :description, :price_per_day, :photos, presence: true
  validates :capacity, numericality: true

  def set_rating
    total = 0
    self.bookings.each do |booking|
      if booking.review
        total += booking.review.rating
      end
    end
    count = 0
    self.bookings.each do |booking|
      if booking.review
        count += 1
      end
    end
    if count == 0
      self.rating = 0
    else
    self.rating = total / count
    end
  end
end
