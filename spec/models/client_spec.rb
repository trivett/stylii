require "spec_helper"

describe Client do

  it { should have_secure_password }
  it { should have_many :appointments }
  it { should have_many(:stylists).through(:appointments) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :birthdate }
  it { should validate_presence_of :gender }
  it { should validate_presence_of :password_digest }
  # it { should validate_uniqueness_of :email }
  # it { should validate_uniqueness_of :phone_number }

  it "has a numeric age" do
    me = Client.create(name: "Vincent", photo_url: "https://pbs.twimg.com/profile_images/1734417364/2010_12_09_VincentTea_7_.jpg", birthdate: Date.new(1984,07,13), gender: "male", phone_number: "6465156222", email: "trivett@gmail.com", password: "abcd", password_confirmation: "abcd")
    expect(me.age).to eq(29)
  end


end
