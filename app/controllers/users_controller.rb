class UsersController < ApplicationController

  def show
    @bookings = Booking.where(user_id: current_user.id)

    review_count = 0.0
    total_rating = 0.0

    @bookings.each do |booking|
      unless booking.review.nil?
        review_count += 1
        total_rating += (booking.review.booking_rating + booking.review.punctuality_rating) / 2.0
      end
    end

    unless review_count == 0.0
      current_user.rating = total_rating / review_count
      current_user.save!
    end

  end

  def dashboard
    @restaurants = Restaurant.where(user_id: current_user.id).left_joins(:bookings).group(:id).order('COUNT(bookings.id) DESC')
  end
end
