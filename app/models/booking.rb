class Booking < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :reviews

  validates :date, :time, :party, presence: true
end
