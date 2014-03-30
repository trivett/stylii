class Client < ActiveRecord::Base
  has_secure_password

  has_many :appointments
  has_many :stylists, through: :appointments

  validates :name, :birthdate, :password_digest, :gender, presence: true
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true


  def age
    age = (self.birthdate - DateTime.now).to_i
    in_years = age / 365 #fix later ;)
    return in_years.abs
  end

end
