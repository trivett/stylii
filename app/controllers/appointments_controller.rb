class AppointmentsController < ApplicationController

   before_action :require_authentication, only: [:create, :edit, :update, :destroy]

  def new
    @stylist = Stylist.find(params[:stylist_id])
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.save
    redirect_to root_path
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to root_path
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @stylist = Stylist.find(@appointment.stylist_id)
    @salon = Salon.find(@stylist.id)
    @stylists = @salon.stylists
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    redirect_to root_path
  end



  private
  def appointment_params
    params.require(:appointment).permit(:client_id, :stylist_id, :user_input)
  end

end
