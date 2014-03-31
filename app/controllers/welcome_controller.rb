class WelcomeController < ApplicationController

  def index
    if current_client
      @appointments = Appointment.where(client_id: current_client.id)
    end
  end

end
