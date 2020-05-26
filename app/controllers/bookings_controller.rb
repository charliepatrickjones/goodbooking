class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
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
    @booking.restaurant = @restaurant
    @booking.user = current_user
    @booking.accepted = false # set default value

    if @booking.save
      redirect_to @restaurant
    else
      render 'new'
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
end
