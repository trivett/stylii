class WelcomeController < ApplicationController


  def index
    if current_client
      @appointments = Appointment.where(client_id: current_client.id)
      @client = Client.find(current_client.id)

    elsif current_stylist




    end
  end

end
