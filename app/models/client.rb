class Client < ActiveRecord::Base
  has_secure_password

  has_many :appointments
  has_many :stylists, through: :appointments

  validates :name, :birthdate, :password_digest, :gender, presence: true
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true

  # before_action :require_authentitcation
  # before_action :require_authorization


  def age
    now = DateTime.now
    age = now.year - self.birthdate.year
    age -=1 if(now.yday < self.birthdate.yday)
    return age
  end

end

