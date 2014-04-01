class StylistsController < ApplicationController



  def new
    @salon = Salon.find(params[:salon_id])
    @stylist = Stylist.new
    @salons = Salon.all
  end

  def create
    @salon = Salon.find(params[:salon_id])
    @stylist = @salon.stylists.create(stylist_params)
    redirect_to @salon
  end


  def show
    @stylist = Stylist.find(params[:id])
    @stylist_appointments = Appointment.where(:stylist_id => @stylist.id)
    ## !!!! consider moving to model !!!
    @rated_appointments = @stylist_appointments.where(:stylii_rating != nil && :stylist_id => @stylist.id)
    sum = 0.0
    @rated_appointments.each { |x| sum += x.stylii_rating.to_f }
    @rating_average = sum / (Appointment.where(:stylii_rating => nil).count - Appointment.all.count).abs
    @stylist.update(:rating_average => @rating_average)
  end




  private
  def stylist_params
    params.require(:stylist).permit(:name, :male_price, :female_price, :specialty, :password, :password_confirmation, :photo_url, :birthdate, :day_off, :starts_work_at, :ends_work_at, :email)
  end


end
