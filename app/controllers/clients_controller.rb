class ClientsController < ApplicationController

  before_action :require_authentication, only: [:edit, :update, :destroy]

  def index
    @clients = Client.all
  end

  def show
    @client  = Client.find(params[:id])
    @appointments = Appointment.where(:client_id => @client.id)
    @stylists = @client.stylists
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    unless @client.errors.any?
      @client.save
    else
      render 'new'
    end
  end

  def edit
    @client = Client.find(params[:id])

    if current_client == @client
      render 'edit'
    else
      redirect_to root_path
    end
  end

  def update
    @client = Client.find(params[:id])
    if current_client == @client
      @client.update(client_params)
      redirect_to @client
    else
      redirect_to root_path
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    session[:client_id] = nil

    redirect_to root_path
  end

 private
  def client_params
    params.require(:client).permit(:name, :email, :password, :password_confirmation, :photo_url, :birthdate, :gender, :email, :phone_number)
  end
end

