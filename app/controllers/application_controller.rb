class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :current_client
  helper_method :current_stylist
  def current_client
    if session[:client_id]
      return Client.find(session[:client_id])
    else
      return nil
    end
  end

  def require_authentication
    if current_client == nil && current_stylist == nil
      redirect_to login_path
    end
  end

  def current_stylist
    if session[:stylist_id]
      return Stylist.find(session[:stylist_id])
    else
      return nil
    end
  end

  def require_stylist_authentication
    if current_stylist == nil
      redirect_to root_path
    end
  end

  def require_authorization
    if current_client != @client.id
      redirect_to root_path
    end
  end

  def require_stylist_authorization
    if current_stylist != @stylist.id
      redirect_to root_path
    end
  end


end
