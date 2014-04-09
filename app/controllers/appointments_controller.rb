class AppointmentsController < ApplicationController

   before_action :require_authentication, only: [:create, :edit, :update, :destroy]

  def show
    @appointment = Appointment.find(params[:id])
    @stylist = Stylist.find(@appointment.stylist_id)
    @client = Client.find(@appointment.client_id)
  end

  def new
    @stylist = Stylist.find(params[:stylist_id])
    @appointment = Appointment.new
  end

  def create
    # my_hash = appointment_params
    @appointment = Appointment.new(appointment_params)
    @stylist = Stylist.find(@appointment.stylist_id)
    @appointment.parse_start
    @appointment.ending
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
    @salon = Salon.find(@stylist.salon_id)
    @stylists = @salon.stylists
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    @appointment.save
    redirect_to root_path
  end



  private
  def appointment_params
    params.require(:appointment).permit(:client_id, :stylist_id, :user_input, :stylii_rating, :end_time, :notes)
  end

end

