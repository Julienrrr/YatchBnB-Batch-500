class Boat < ApplicationRecord
  geocoded_by :address

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many_attached :photos

  validates :name, :boat_model, :capacity, :description, :price_per_day, :photos, presence: true
  validates :capacity, numericality: true

  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model

  pg_search_scope :search_by_name_and_boat_model_and_description,
  against: [ :name, :boat_model, :description, :address ],
  using: {
    tsearch: { prefix: true }
  }

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
