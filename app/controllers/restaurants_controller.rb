class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
	  @restaurant = Restaurant.new
	end

	def create
		restaurant = Restaurant.create(params[:restaurant].permit(:name, :description, :location, :postcode))
		redirect_to restaurants_path
	end

	def edit
	  @restaurant = Restaurant.find(params[:id])
	end

	def show
	  @restaurant = Restaurant.find(params[:id])
	end

	def update
	  @restaurant = Restaurant.find(params[:id])
	  @restaurant.update(params[:restaurant].permit(:name, :description, :location, :postcode))
	  redirect_to restaurants_path
	end

	def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = "Restaurant deleted successfully"
    redirect_to restaurants_path
	end

end
