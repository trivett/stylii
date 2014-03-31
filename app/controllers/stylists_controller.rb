class StylistsController < ApplicationController

  def index

  end

  def show
    @stylist = Stylist.find(params[:id])
    @stylist_appointments = Appointment.where(:stylist_id => @stylist.id)
    @rated_appointments = @stylist_appointments.where(:stylii_rating != nil && :stylist_id => @stylist.id)
    sum = 0.0
    @rated_appointments.each { |x| sum += x.stylii_rating.to_f }
    @rating_average = sum / (Appointment.where(:stylii_rating => nil).count - Appointment.all.count).abs
  end

end
