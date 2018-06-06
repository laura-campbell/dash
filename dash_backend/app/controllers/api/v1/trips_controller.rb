class Api::V1::TripsController < Api::V1::BaseController

  def index
    respond_with Trip.all
  end

  def create
    respond_with :api, :v1, Trip.create(trip_params)
  end

  def destroy
     respond_with Trip.destroy(params[:id])
   end

   def update
     trip = Trip.find(params["id"])
     trip.update_attributes(trip_params)
     respond_with trip, json: trip
   end

   private

   def trip_params
     params.require(:trip).permit(:user_id, :id, :name, :origin, :destination)
   end
 end
