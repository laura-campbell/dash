class Api::V1::TripsController < ApplicationController

   def index
     @trips = Trip.all
     render json: @trips
   end

   def show
     @trip = Trip.find(params[:id])
     render json: @trip
   end

   def trip_flights
     @trip = Trip.find(params[:trip_id])
     @trip_flights = Flight.all.select{ |flight| flight[:trip_id] == @trip.id }
     render json: @trip_flights
   end

   def create
     @user = User.find_by(id: params[:user_id])
     @trip = Trip.create(trip_params)
     render json: @trip
   end

   def update
     @trip = Trip.find(params[:trip_id])
     @trip.update(trip_params)
     render json: @trip
   end

private

  def trip_params
    params.require(:trip).permit(:user_id,  :name,  :start_date, :end_date)
  end
 end
