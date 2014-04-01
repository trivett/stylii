require "spec_helper"
describe Appointment do
  it "parses time inputs" do
    Stylist.create(salon_id: 1, name: "Mike", birthdate: Date.new(1988,04,04), male_price: 40, female_price: 60, specialty: "fades", photo_url: "http://www.metal-archives.com/images/5/6/2/4/56249_artist.jpg?261", email: "mike@gmail.com", rating_average: nil, starts_work_at: "9:00 a.m.", ends_work_at: "5:00 p.m.", day_off: "Tuesday", password: "abcd", password_confirmation: "abcd")

    Client.create(name: "Vincent", photo_url: "https://pbs.twimg.com/profile_images/1734417364/2010_12_09_VincentTea_7_.jpg", birthdate: Date.new(1984,07,13), gender: "male", phone_number: "6465156222", email: "trivett@gmail.com", password: "abcd", password_confirmation: "abcd")

    a = Appointment.new(client_id: 1, stylist_id: 1, start_time: nil, end_time: nil, user_input: "tomorrow at noon")
    a.parse_start
    expect(a.start_time.class).to eq(ActiveSupport::TimeWithZone)
  end


  it "makes the ending from the start_time" do
    Stylist.create(salon_id: 1, name: "Mike", birthdate: Date.new(1988,04,04), male_price: 40, female_price: 60, specialty: "fades", photo_url: "http://www.metal-archives.com/images/5/6/2/4/56249_artist.jpg?261", email: "mike@gmail.com", rating_average: nil, starts_work_at: "9:00 a.m.", ends_work_at: "5:00 p.m.", day_off: "Tuesday", password: "abcd", password_confirmation: "abcd")

    Client.create(name: "Vincent", photo_url: "https://pbs.twimg.com/profile_images/1734417364/2010_12_09_VincentTea_7_.jpg", birthdate: Date.new(1984,07,13), gender: "male", phone_number: "6465156222", email: "trivett@gmail.com", password: "abcd", password_confirmation: "abcd")

    a = Appointment.new(client_id: 1, stylist_id: 1, start_time: nil, end_time: nil, user_input: "tomorrow at noon")
    a.parse_start
    a.ending
    expect(a.end_time.class).to eq(ActiveSupport::TimeWithZone)
  end

  it "shouldn't let you make an appointment while the stylist is working" do
    Stylist.create(salon_id: 1, name: "Mike", birthdate: Date.new(1988,04,04), male_price: 40, female_price: 60, specialty: "fades", photo_url: "http://www.metal-archives.com/images/5/6/2/4/56249_artist.jpg?261", email: "mike@gmail.com", rating_average: nil, starts_work_at: "9:00 a.m.", ends_work_at: "5:00 p.m.", day_off: "Tuesday", password: "abcd", password_confirmation: "abcd")

    Client.create(name: "Vincent", photo_url: "https://pbs.twimg.com/profile_images/1734417364/2010_12_09_VincentTea_7_.jpg", birthdate: Date.new(1984,07,13), gender: "male", phone_number: "6465156222", email: "trivett@gmail.com", password: "abcd", password_confirmation: "abcd")

    a = Appointment.new(client_id: 1, stylist_id: 1, start_time: nil, end_time: nil, user_input: "tuesday at noon")
    a.parse_start
    a.ending
    expect(a.valid?).to eq(false)
  end

  it "shouldn't let you shedule an appointment when the stylist isn't at work" do

    Stylist.create(salon_id: 1, name: "Mike", birthdate: Date.new(1988,04,04), male_price: 40, female_price: 60, specialty: "fades", photo_url: "http://www.metal-archives.com/images/5/6/2/4/56249_artist.jpg?261", email: "mike@gmail.com", rating_average: nil, starts_work_at: "9:00 a.m.", ends_work_at: "5:00 p.m.", day_off: "Tuesday", password: "abcd", password_confirmation: "abcd")

    Client.create(name: "Vincent", photo_url: "https://pbs.twimg.com/profile_images/1734417364/2010_12_09_VincentTea_7_.jpg", birthdate: Date.new(1984,07,13), gender: "male", phone_number: "6465156222", email: "trivett@gmail.com", password: "abcd", password_confirmation: "abcd")

    a = Appointment.new(client_id: 1, stylist_id: 1, start_time: nil, end_time: nil, user_input: "tomorrow at seven am")
    a.parse_start
    a.ending

    expect(a.valid?).to eq(false)

  end

   it "shouldn't let you shedule an appointment when a stylist is booked" do

    Stylist.create(salon_id: 1, name: "Mike", birthdate: Date.new(1988,04,04), male_price: 40, female_price: 60, specialty: "fades", photo_url: "http://www.metal-archives.com/images/5/6/2/4/56249_artist.jpg?261", email: "mike@gmail.com", rating_average: nil, starts_work_at: "9:00 a.m.", ends_work_at: "5:00 p.m.", day_off: "Tuesday", password: "abcd", password_confirmation: "abcd")

    Client.create(name: "Vincent", photo_url: "https://pbs.twimg.com/profile_images/1734417364/2010_12_09_VincentTea_7_.jpg", birthdate: Date.new(1984,07,13), gender: "male", phone_number: "6465156222", email: "trivett@gmail.com", password: "abcd", password_confirmation: "abcd")

    a = Appointment.new(client_id: 1, stylist_id: 1, start_time: nil, end_time: nil, user_input: "tomorrow at ten am")
    a.parse_start
    a.ending

    b = Appointment.new(client_id: 1, stylist_id: 1,start_time: nil, end_time: nil, user_input: "tomorrow at ten am")
    b.parse_start
    b.ending

    expect(b.valid?).to eq(false)

  end


end


