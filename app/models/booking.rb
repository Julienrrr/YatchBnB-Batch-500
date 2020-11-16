class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat

  # validates :price, :status, presence: true
  validates :start_date, :end_date, availibility: false
  valdiates :boat, uniqueness: { scope: :start_date }
end
