
 class Api::V1::TripsController < ApplicationController

  def index
    if (valid_token?)
      render json: Trip.all
    else
      render json: { go_away: true }, status: :unauthorized
    end
  end

end


# class Api::V1::TripsController < ApplicationController
#
#   def index
#     render json: Trip.all
#   end
#
#   def create
#     render json: Trip.create(trip_params)
#   end
#
#   def destroy
#      render json: Trip.destroy(params[:id])
#    end
#
#    def update
#      trip = Trip.find(params["id"])
#      trip.update_attributes(trip_params)
#      render json: trip
#    end
#
#    private
#
#    def trip_params
#      params.require(:trip).permit(:user_id, :id, :name, :origin, :destination)
#    end
#  end
