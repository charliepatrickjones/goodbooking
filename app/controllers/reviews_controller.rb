class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end


  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.user = @booking.user
    if @review.save

      redirect_to restaurant_bookings_path(@booking.restaurant.id), success: "Thanks for submitting the guest's review!"
    else
      redirect_to restaurant_bookings_path(@booking.restaurant.id), warning: "Your review attempt is not successful. Please try it again."
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if review.update(review_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
      @review = Review.find
      @review.destroy

      redirect_to review_path
  end

  private


  def review_params
      params.require(:review).permit(:content, :booking_rating, :punctuality_rating)
  end


end
