class Stylist < ActiveRecord::Base
  has_secure_password

  belongs_to :salon

  has_many :appointments
  has_many :clients, through: :appointments
  # before_action :require_authentitcation
  # before_action :require_authorization, only: [:edit, :destroy]
  def age
    age = (self.birthdate - DateTime.now).to_i
    in_years = age / 365 #fix later ;)
    return in_years.abs
  end
end
