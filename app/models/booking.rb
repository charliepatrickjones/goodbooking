class Booking < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_one :review, dependent: :destroy

  validates :date, :time, :party, presence: true
end
