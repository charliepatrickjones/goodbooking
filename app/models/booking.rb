class Booking < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :date, :time, :party, presence: true
end
