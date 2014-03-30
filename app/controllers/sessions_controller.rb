class SessionsController < ApplicationController

  def new
    redirect_to root if current_client
  end

  def create
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

end
