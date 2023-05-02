class PagesController < ApplicationController
 # skip_before_action :authenticate_user!, only: [ :home ]
  before_action :set_restaurants

  def home
    @reservation = Reservation.new
  end

  private

  def set_restaurants
    @restaurants = Restaurant.all
  end
end
