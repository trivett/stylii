class StylistsController < ApplicationController

  def index

  end

  def show
    @stylist = Stylist.find(params[:id])

  end

end
