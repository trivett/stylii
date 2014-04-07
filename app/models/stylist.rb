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



end
