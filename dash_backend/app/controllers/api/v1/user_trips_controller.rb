class Api::V1::UserTripsController < Api::V1::BaseController

  def index
    respond_with UserTrip.all
  end

  def create
    respond_with :api, :v1, UserTrip.create(usertrip_params)
  end

  def destroy
     respond_with UserTrip.destroy(params[:id])
   end

   def update
     usertrip = UserTrip.find(params["id"])
     usertrip.update_attributes(usertrip_params)
     respond_with usertrip, json: usertrip
   end

   private

   def usertrip_params
     params.require(:usertrip).permit(:id)
   end
 end
