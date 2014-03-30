class WelcomeController < ApplicationController

  def index
    @appointments = Appointment.where(:client_id => current_client.id)
  end

end
