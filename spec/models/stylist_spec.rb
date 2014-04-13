require "spec_helper"

describe Stylist do
  it { should belong_to :salon }
  it { should have_many :appointments }
  it { should have_many(:clients).through(:appointments) }

  it "has a numeric age" do
    mike = Stylist.create(salon_id: 1, name: "Mike", birthdate: Date.new(1988,04,04), male_price: 40, female_price: 60, specialty: "fades", photo_url: "http://www.metal-archives.com/images/5/6/2/4/56249_artist.jpg?261", email: "mike@gmail.com", rating_average: nil, starts_work_at: "9:00 a.m.", ends_work_at: "5:00 p.m.", day_off: "Tuesday", password: "abcd", password_confirmation: "abcd")
    expect(mike.age).to eq(26)
  end

end
