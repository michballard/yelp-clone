class ReviewsController < ApplicationController

  def new 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(params[:review].permit(:rating, :thoughts))
    if @review.save
	    redirect_to restaurants_path
		else
			render 'new'
		end
  end

end
