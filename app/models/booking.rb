class Booking < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :reviews
end
