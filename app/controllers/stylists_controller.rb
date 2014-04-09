class StylistsController < ApplicationController

   before_action :require_authentication, only: [:edit, :update, :destroy]
  before_action :require_stylist_authorization, only: [:edit, :update, :destroy]

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
    @rating = @stylist.rating
  end

  def edit
    @stylist = Stylist.find(params[:id])
    if current_stylist == @stylist
      render 'edit'
    else
      redirect_to root_path
    end
  end

  def update
    @stylist =Stylist.find(params[:id])
    if current_stylist == @stylist
      @stylist.update(stylist_params)
      redirect_to @stylist
    else
      redirect_to root_path
    end
  end


  def destroy
    @stylist = Stylist.find(params[:id])
    @stylist.destroy
    if current_stylist == @stylist
      session[:stylist_id] =  nil
    end
    redirect_to root_path
  end


  private
  def stylist_params
    params.require(:stylist).permit(:name, :male_price, :female_price, :specialty, :password, :password_confirmation, :photo_url, :birthdate, :day_off, :starts_work_at, :ends_work_at, :email)
  end


end
