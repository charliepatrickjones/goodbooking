class UsersController < ApplicationController
  def show
    @bookings = Booking.where(user_id: current_user.id)
  end
  def dashboard

  end
end
