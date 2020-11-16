class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat

  # validates :price, :status, presence: true
  validates :start_date, :end_date, availibility: false
  validates :boat, uniqueness: { scope: :start_date }
end
