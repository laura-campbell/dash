class Api::V1::FlightsController < ApplicationController


   def index
     @flights = Flight.all
     render json: @flights
   end

  def show
    @flight = Flight.find(params[:id])
    render json: @flight
  end

  def create
    @trip = Trip.find_by(id: params[:trip_id])
    @flight = Flight.create(flight_params)
    render json: @flight
  end

private

  def flight_params
    params.require(:flight).permit(:trip_id, :departure_terminal, :arrival_airport, :arrival_time, :airline, :departure_airport, :departure_time, :flight_number, :stops)
  end
end
