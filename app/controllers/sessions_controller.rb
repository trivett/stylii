class SessionsController < ApplicationController

  def new
    redirect_to root_path if current_client || current_stylist
  end


  def create
    current_stylist = nil
    @client = Client.find_by(email: params[:email])
    if @client && @client.authenticate(params[:password])
      session[:client_id] = @client.id
      redirect_to @client
    else
      render 'new'
    end
  end

  def destroy
    session[:client_id] = nil
    redirect_to root_path
  end

  def new_stylist
    redirect_to root if current_client || current_stylist
  end

  def create_stylist_session
    current_client = nil
    @stylist = Stylist.find_by(email: params[:email])
    if @stylist && @stylist.authenticate(params[:password])
      session[:stylist_id] = @stylist.id
      redirect_to root_path
    else
      render 'new_stylist'
    end
  end

  def destroy_stylist
    session[:stylist_id] = nil
    redirect_to root_path
  end

end
