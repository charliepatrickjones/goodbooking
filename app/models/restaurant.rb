class Restaurant < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
