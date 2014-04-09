class Stylist < ActiveRecord::Base
  has_secure_password

  belongs_to :salon

  has_many :appointments
  has_many :clients, through: :appointments
  # before_action :require_authentitcation
  # before_action :require_authorization, only: [:edit, :destroy]

  def age
    now = DateTime.now
    age = now.year - self.birthdate.year
    age -=1 if(now.yday < self.birthdate.yday)
    return age
  end

  def rating
    rated = []
    sum = 0.0
    self.appointments.each do |a|
      unless a.stylii_rating == nil
        rated << a
      end
    end
    rated.each do |x|
      sum += x.stylii_rating
    end
    rating_average = sum / rated.count
    if rated.count == 0
      return sum
    else
      return rating_average
    end
  end
end
