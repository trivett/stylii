class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :current_client
  def current_client
    if session[:client_id]
      return Client.find(session[:client_id])
    else
      return nil
    end
  end

  def require_authentication
    if current_client == nil
      redirect_to login_path
    end
  end
end
