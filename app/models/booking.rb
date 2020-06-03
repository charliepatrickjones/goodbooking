class Booking < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_one :review

  validates :date, :time, :party, presence: true
end
