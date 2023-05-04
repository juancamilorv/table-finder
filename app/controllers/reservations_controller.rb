class ReservationsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]
  before_action :set_reservation, only: %i[edit update destroy]

  def new
    @reservation = Reservation.new
  end




  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.restaurant = @restaurant
    @reservation.user = current_user

    consideration1 = @restaurant.reservations.where(date: @reservation.date).count < 3 # Change limit to 15
    consideration2 = Reservation.where(date: @reservation.date).count < 5 # Change limit to 20

    if consideration1 && consideration2
      @reservation.save
      redirect_to root_path, notice: "Reservation made!"
    else
      redirect_to new_restaurant_reservation_path(@restaurant), notice: "Sorry! There are no more tables available."
    end
  end





  def edit
    # @restaurant = @reservation.restaurant
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path, notice: 'Reservation was successfully updated!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @reservations = Reservation.where(user: current_user)
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path, notice: 'Reservation was successfully deleted!'
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :restaurant_id, :date)
  end
end
