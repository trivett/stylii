require "spec_helper"

describe Appointment do

  # it { should belong_to(:client) }
  # it { should belong_to(:stylist) }
  # it { should validate_uniqueness_of(:start_time).scoped_to([:client_id, :stylist_id]) }



  subject(:ron) { Stylist.create(salon_id: 1, name: "Ron", birthdate: Date.new(1958,04,04), male_price: 40, female_price: 60, specialty: "jerry curls", photo_url: "http://images4.mtv.com/uri/mgid:file:docroot:mtv.com:/shared/media/images/amg_artist_portraits/standard/drp000/p049/p04913l4n44.jpg?enlarge=false&matte=true&matteColor=black&quality=0.85", email: "ron@gmail.com", rating_average: nil, starts_work_at: "4:00 a.m.", ends_work_at: "2:00 p.m.", day_off: "Sunday", password: "abcd", password_confirmation: "abcd") }
  let(:mckenneth) { Client.create(name: "McKenneth", photo_url: "http://farm4.staticflickr.com/3807/11836537024_1137e50ff1_o.jpg", birthdate: Date.new(1987,05,12), gender: "male", phone_number: "6465156224", email: "mckenneth@gmail.com", password: "abcd", password_confirmation: "abcd") }
  let(:me) { Client.create(name: "Natalie", photo_url: "http://www.celebhairdo.com/wp-content/uploads/2014/02/natalie.jpg", birthdate: Date.new(1927,03,11), gender: "female", phone_number: "2125156324", email: "natalie@gmail.com", password: "abcd", password_confirmation: "abcd")
}

  it "parses time inputs" do
    a = Appointment.new(client_id: mckenneth.id, stylist_id: ron.id, start_time: nil, end_time: nil, user_input: "tomorrow at noon")
    a.parse_start
    expect(a.start_time.class).to eq(ActiveSupport::TimeWithZone)
  end


  it "makes the ending from the start_time" do
    a = Appointment.new(client_id: mckenneth.id, stylist_id: ron.id, start_time: nil, end_time: nil, user_input: "tomorrow at noon")
    a.parse_start
    a.ending
    expect(a.end_time.class).to eq(ActiveSupport::TimeWithZone)
  end

  it "shouldn't let you make an appointment while the stylist is off that day" do
    a = Appointment.new(client_id: mckenneth.id, stylist_id: ron.id, start_time: nil, end_time: nil, user_input: "next tuesday at four p.m.")
    a.parse_start
    a.ending
    a.save
    expect(a.errors.messages[:start_time]).to include("can't be before stylist starts work or go on past stylist's time to go home")
  end

  it "shouldn't let you shedule an appointment when the stylist isn't at work" do
    a = Appointment.new(client_id: mckenneth.id, stylist_id: ron.id, start_time: nil, end_time: nil, user_input: "tomorrow at four am")
    a.parse_start
    a.ending

    expect(a.valid?).to eq(false)

  end

   it "shouldn't let you shedule an appointment when a stylist is booked" do
      a = Appointment.new(client_id: mckenneth.id, stylist_id: ron.id, start_time: nil, end_time: nil, user_input: "thursday at ten a.m.")
      a.parse_start
      a.ending
      a.save

      b = Appointment.new(client_id: me.id, stylist_id: ron.id ,start_time: nil, end_time: nil, user_input: "thursday at ten a.m.")
      b.parse_start
      b.ending
      b.save

      binding.pry
      expect(b.valid?).to eq(false)
      # expect(b.errors.messages[:start_time]).to include("can't be during another customer's haircut")
  end
end


