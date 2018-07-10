class Api::V1::EventsController < ApplicationController

  def index
    @events = Event.all
    render json: @events
  end

 def show
   @event = Event.find(params[:id])
   render json: @event
 end

 def create
   @event = Event.create(event_params)
   render json: @event
 end

 def day_events
   @day = Day.find(params[:day_id])
   @day_events = Event.all.select{ |event| event[:day_id] == @day.id }
   render json: @day_events
 end

private

 def event_params
   params.require(:event).permit(:day_id, :description)
 end
end
