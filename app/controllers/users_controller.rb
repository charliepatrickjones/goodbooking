class UsersController < ApplicationController
  def show
    @bookings = Booking.where(user_id: current_user.id)
  end
  def dashboard
    @restaurants = Restaurant.where(user_id: current_user.id).left_joins(:bookings).group(:id).order('COUNT(bookings.id) DESC')
  end
end
