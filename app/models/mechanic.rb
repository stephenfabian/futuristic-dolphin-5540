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

end