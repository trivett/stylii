class SalonsController < ActionController::Base

  def index
    @salons = Salon.all
  end

  def show
    @salon = Salon.find(params[:id])

  end

  def new
    @salon = Salon.new
    # the only param will be
  end

  def create
    @salon = Salon.new(salon_params)
  end


  private
  def salon_params
    params.require(:salon).permit(:phone_number)
  end


end



