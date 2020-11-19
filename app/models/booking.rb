class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  has_one :review

  validates :status, presence: true, inclusion: { in: ["pending", "accepted", "refused"]}
  validates :start_date, :end_date, availibility: false
  validates :boat, uniqueness: { scope: :start_date }
  before_save :set_duration
  before_save :set_price

  def set_duration
    self.duration = (self.end_date - self.start_date) / 86400
  end

  def set_price
    self.price = self.duration * self.boat.price_per_day
  end
end
