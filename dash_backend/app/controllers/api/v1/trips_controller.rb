class Api::V1::TripsController < ApplicationController

   def index
     @trips = Trip.all
     render json: @trips
   end

   def show
     @trip = Trip.find_by(params[:id])
     render json: @trip
   end

   def create
     @user = User.find_by(id: params[:user_id])
     @trip = Trip.create(trip_params)
     render json: @trip
   end

   def update
   end

private

  def trip_params
    params.require(:trip).permit(:user_id,  :name,  :origin, :destination, :outboundDepartureCity, :outboundArrivalCity, :outboundDepartureDate, :outboundAirline, :outboundDepartureTime, :returnDepartureCity, :returnArrivalCity, :returnDepartureDate, :returnAirline, :returnDepartureTime)
  end
 end
