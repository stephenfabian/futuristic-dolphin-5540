class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_mechanic_experience
    avg = self.average(:years_of_experience)
    if avg == nil
      return 0
    else
      return avg
    end
  end

  def open_rides_sorted_by_thrill
      rides = self.rides.where(open: TRUE)
      rides.order(thrill_rating: :desc)
  end

end