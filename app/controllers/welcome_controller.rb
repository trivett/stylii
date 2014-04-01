class WelcomeController < ApplicationController


  def index
    if current_client
      @appointments = Appointment.where(client_id: current_client.id)
      @client = Client.find(current_client.id)

    elsif current_stylist
      @appointments = Appointment.where(stylist_id: current_stylist.id)

      @stylist = Stylist.find(current_stylist.id)
      # @todays_appointments = @appointments.where(start_time.day == Chronic.parse("today").day)

    end
  end

end
