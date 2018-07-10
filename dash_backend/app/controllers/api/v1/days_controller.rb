class Api::V1::DaysController < ApplicationController

   def index
     @days = Day.all
     render json: @days
   end

  def show
    @day = Day.find(params[:id])
    render json: @day
  end

  def create
    @day = Day.find_or_create_by(day_params)
    render json: @day
  end

  def trip_days
    @trip = Trip.find(params[:trip_id])
    @trip_days = Day.all.select{ |day| day[:trip_id] == @trip.id }
    render json: @trip_days
  end

private

  def day_params
    params.require(:day).permit(:trip_id, :daystring)
  end
end
