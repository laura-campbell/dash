
 class Api::V1::TripsController < ApplicationController

   def index
     @trips = Trip.all
     render json: @trips
   end

   def show
     @trip = Trip.find_by(slug: params[:slug])
     render json: @trip
   end

   def create

   end

   def update

   end


 end
