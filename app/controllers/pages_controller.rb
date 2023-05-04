class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @restaurants = Restaurant.all

    if params[:query].present?
      @restaurants = @restaurants.where("name ILIKE ? OR city ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end



    if user_signed_in? && current_user.hoster
      @reservations = []
      @current_user.restaurants.each do |restaurant|

        @reservations.concat(restaurant.reservations)
      end
    end
  end


end
