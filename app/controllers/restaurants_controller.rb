class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :check_role, only: [:new, :create, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @restaurants = Restaurant.all
    if params[:category].present?
      @restaurants = @restaurants.where(category: params[:category])
    end
    if params[:address].present?
      @restaurants = @restaurants.near(params[:address], 20)
    end
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
        # image_url: helpers.asset_url('/app/assets/images/bf-logo.png')

      }
    end
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to dashboard_path(current_user), alert: "LISTING CREATED"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to dashboard_path(current_user), alert: "LISTING UPDATED"
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to dashboard_path(current_user), alert: "LISTING DELETED"
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address, :rating, :phone_number, :capacity, :menu, :description, :price_range, photos: [])
  end

  def check_role
    unless current_user.role == "owner"
      redirect_to root_path, alert: "ACCESS DENIED"
    end
  end
end
