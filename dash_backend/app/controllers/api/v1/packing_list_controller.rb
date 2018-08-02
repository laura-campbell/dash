class Api::V1::PackingListController < ApplicationController

   def index
     @items = PackingList.all
     render json: @items
   end

  def show
    @item = PackingList.find(params[:id])
    render json: @item
  end

  def create
    @item = PackingList.create(packinglist_params)
    render json: @item
  end

  def trip_items
    @trip = Trip.find(params[:trip_id])
    @trip_items = PackingList.all.select{ |item| item[:trip_id] == @trip.id }
    render json: @trip_items
  end

  def destroy
    @item = PackingList.find(params[:id])
    @item.destroy
    render json: @item
  end

private

  def packinglist_params
    params.require(:packing_list).permit(:trip_id, :name)
  end
end
