class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @mechanics_average_years_experience = @mechanics.average_mechanic_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides_working_on = @mechanic.open_rides_sorted_by_thrill
  end
end