class ReviewsController < ApplicationController
    def index
        @review = Review.all
    end

    def show
    end

    def create
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new(review_params)

        @review.restaurant = restaurant
        if @review.save
            redirect_to @review
        else
            render 'new'
        end

    end

    def new 
        @restaurant = Restaurant.find(params[:id])
        @review = Review.new
    end

    def edit
        @review = Review.find(params[:id])
    end    

    def update 
        @review = Review.find(params[:id])
        
        if review.update(review_params)
            redirect_to @review
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
        params.require(review).permit(:content, :rating)

    
end
