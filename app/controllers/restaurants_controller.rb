class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[edit update destroy]

  def index
    @restaurants = Restaurant.where(user: current_user)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    @restaurant.save
    redirect_to restaurants_path
  end

  def edit
  end

  def update
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, notice: 'Restaurant was successfully deleted!'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :city, :photo, :user_id)
  end
end
