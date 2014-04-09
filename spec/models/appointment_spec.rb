require "spec_helper"
describe Appointment do

  subject(:mike) { Stylist.first }
  subject(:me) { Client.first }
  subject(:mckenneth) { Client.find(15) }

  it "parses time inputs" do
    a = Appointment.new(client_id: 1, stylist_id: 1, start_time: nil, end_time: nil, user_input: "tomorrow at noon")
    a.parse_start
    expect(a.start_time.class).to eq(ActiveSupport::TimeWithZone)
  end


  it "makes the ending from the start_time" do
    a = Appointment.new(client_id: 1, stylist_id: 1, start_time: nil, end_time: nil, user_input: "tomorrow at noon")
    a.parse_start
    a.ending
    expect(a.end_time.class).to eq(ActiveSupport::TimeWithZone)
  end

  it "shouldn't let you make an appointment while the stylist is working" do
    a = Appointment.new(client_id: 1, stylist_id: 1, start_time: nil, end_time: nil, user_input: "next tuesday at noon")
    a.parse_start
    a.ending
    a.save
    expect(a.errors.messages[:start_time][0]).to eq("can't be on stylist's day off")
  end

  it "shouldn't let you shedule an appointment when the stylist isn't at work" do
    a = Appointment.new(client_id: 1, stylist_id: 1, start_time: nil, end_time: nil, user_input: "tomorrow at four am")
    a.parse_start
    a.ending
    # expect(a.errors.messages[:start_time][0]).to eq("can't be before stylist starts work or go on past stylist's time to go home")
    expect(a.valid?).to eq(false)

  end

   it "shouldn't let you shedule an appointment when a stylist is booked" do
      a = Appointment.new(client_id: 1, stylist_id: 1, start_time: nil, end_time: nil, user_input: "thursday at ten am")
      a.parse_start
      a.ending
      a.save
      b = Appointment.new(client_id: 15, stylist_id: 1,start_time: nil, end_time: nil, user_input: "thursday at ten am")
      b.parse_start
      b.ending
      b.save

      expect(b.errors.messages[:start_time][0]).to eq("can't be during another customer's haircut")


  end


end


