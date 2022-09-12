class MechanicRidesController < ApplicationController

def update
    @mechanic = Mechanic.find(params[:mechanic_id])
    MechanicRide.create!(mechanic_id: params[:mechanic_id], ride_id: params[:Ride_Id])
    redirect_to "/mechanics/#{@mechanic.id}"
end

end