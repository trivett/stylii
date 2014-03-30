class Stylist < ActiveRecord::Base
  belongs_to :salon
  has_many :appointments
  has_many :clients, through: :appointments

  def age
    age = (self.birthdate - DateTime.now).to_i
    in_years = age / 365 #fix later ;)
    return in_years.abs
  end
end
