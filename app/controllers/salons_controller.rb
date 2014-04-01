class SalonsController < ApplicationController

  def index
    @salons = Salon.all
  end

  def show
    @salon = Salon.find(params[:id])
    @stylists = Stylist.where(:salon_id => @salon.id)
  end

  def new
    @salon = Salon.new
    # the only param will be
  end

  def create
    @salon = Salon.new(salon_params)
    @salon.lookup_by_phone
    @salon.save

  end


  private
  def salon_params
    params.require(:salon).permit(:phone_number)
  end


end



