class RidesController < ApplicationController

  def new
#    raise params.inspect

    ride = Ride.new(user_id: params["user_id"], attraction_id: params["attraction_id"])
    message = ride.take_ride
    flash[:notice] = message
    user = params["user_id"]
    redirect_to user_path(user)
  end

end
