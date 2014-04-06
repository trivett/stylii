require "spec_helper"

describe Client do
  it "has a numeric age" do
    me = Client.create(name: "Vincent", photo_url: "https://pbs.twimg.com/profile_images/1734417364/2010_12_09_VincentTea_7_.jpg", birthdate: Date.new(1984,07,13), gender: "male", phone_number: "6465156222", email: "trivett@gmail.com", password: "abcd", password_confirmation: "abcd")
    expect(me.age).to eq(29)
  end


end
