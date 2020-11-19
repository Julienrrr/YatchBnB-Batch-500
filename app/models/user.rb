class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boats, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # has_many :requests, through: :boats, class_name: "Booking"
  has_many :reviews, through: :bookings

  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :email, :phone_number, uniqueness: true
  validates :phone_number, numericality: true

  def requests
    self.boats.map(&:bookings).flatten
  end
end
