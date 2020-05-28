class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @restaurant = Restaurant.find(params[:restaurant_id])

    @remaining_slots = find_booking_slots
    set_bookings
    if @booking.party.nil? || @booking.time.nil?
      render action: "new"
    elsif @booking.date < Date.today
      flash.now[:warning] = "you can't book in the past days"
      render action: "new", warning: "you can't book in the past days"
    elsif @booking.party > @remaining_slots[@booking.time]
      redirect_to (@restaurant, warning: "you can't book more than available seats")
      # flash.now[:alert] = "you can't book more than available seats"
      # render 'restaurants/show'
    elsif @booking.save
      redirect_to bookings_path, success: 'your request has been sent!'
      ## will update to redircet to user profile page
    else
      redirect_to @restaurant, warning: "Invalid data. Try it again."
    end

  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to @booking
    else
      render 'edit'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :party)
  end

  def set_bookings
    @booking.restaurant = @restaurant
    @booking.user = current_user
    @booking.accepted = false # set default value
  end

  def find_booking_slots
    # convert string to array
    opening_times = @restaurant.opening_time.split(",")
    # set max capacity
    capacity_h = opening_times.each_with_object({}) do |time, hash|
      hash[time] = @restaurant.capacity
    end
    # aggregate all bookings of the restaurant on the day
    all_bookings = Booking.where(restaurant_id: @restaurant.id, date: @booking.date)
    # subtract bookings time from max capacity
    all_bookings.each do |booking|
      capacity_h.each do |key, value|
        capacity_h[key] -= booking.party if key == booking.time
      end
    end
    capacity_h
  end
end
