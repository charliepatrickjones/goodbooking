class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find(params[:id])
    end

    
    def new 
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new
    end
    
    def create
        @review = Review.new(review_params)
        @restaurant = Restaurant.find(params[:restaurant_id]) 
        @review.restaurant = @restaurant
        if @review.save
            redirect_to restaurant_path(@restaurant)
        else
           redirect_to restaurant_path(@restaurant)
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
        params.require(:review).permit(:content, :booking_rating)
    end

    
end
