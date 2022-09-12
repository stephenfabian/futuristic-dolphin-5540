class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @mechanics_average_years_experience = @mechanics.average_mechanic_experience
  end
end